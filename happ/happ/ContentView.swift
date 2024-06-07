//
//  ContentView.swift
//  happ
//
//  Created by Alexey Ageev on 03.03.2023.
//

import HappAuthorization
import SwiftUI
import MapKit
import HappEvents
import PhotosUI
import Combine

struct ContentView: View {

    @State private var isAddingEvent: Bool = false
    private let subject = PassthroughSubject<Void, Never>()

    private let eventsProvider = EventsProvider()

    var body: some View {
        EventsMapView(eventsProvider: eventsProvider)
            .overlay(alignment: .bottom) {
                AddEventTabBar(isAddingEvent: $isAddingEvent)
            }
            .sheet(isPresented: $isAddingEvent) {
                AddEventSheet(eventsProvider: eventsProvider)
                    .environment(\.colorScheme, .dark)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct AddEventTabBar: View {

    @Binding var isAddingEvent: Bool

    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "map.fill")
                .resizable()
                .scaledToFit()
                .frame(height: 24)
                .foregroundStyle(.gray)

            Spacer()

            Button {
                isAddingEvent = true
            } label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 64, height: 64)
                    .padding(.bottom, 16)
                    .foregroundStyle(.white, .black)
            }
            Spacer()
            Image(systemName: "person.fill")
                .resizable()
                .scaledToFit()
                .frame(height: 24)
                .foregroundStyle(.gray)
            Spacer()

        }
        .frame(maxWidth: .infinity)
        .frame(height: 56)
        .background { Capsule().foregroundStyle(.bar) }
        .padding()
    }
}


struct AddEventSheet: View {

    @State private var pickerItem: PhotosPickerItem?
    @State private var selectedImage: Image?
    @State private var data: Data?

    @State private var title: String = ""

    @Environment(\.dismiss) var dismiss

//    private let client = ImagesUploader()

    private let eventsProvider: EventsProvider

    init(eventsProvider: EventsProvider) {
        self.eventsProvider = eventsProvider
    }

    var body: some View {
        NavigationStack {
            List {
                Section {
                    PhotosPicker(selection: $pickerItem, matching: .images, photoLibrary: .shared()) {
                        if let selectedImage {
                            selectedImage
                                .resizable()
                                .scaledToFit()
                        } else {
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .center)
                                .foregroundStyle(.gray)
                        }
                    }
                    .listRowInsets(EdgeInsets())
                    .disabled(eventsProvider.isLoading)


                    PhotosPicker(selection: $pickerItem, matching: .images, photoLibrary: .shared()) {
                        HStack {
                            Spacer()
                            Text(selectedImage == nil ? "Add Image" : "Change Image")
                            Spacer()
                        }
                        .foregroundStyle(.white)
                    }
                    .disabled(eventsProvider.isLoading)

                }
                Section {
                    TextField("Title", text: $title, axis: .vertical)
                        .lineLimit(2...5)
                        .disabled(eventsProvider.isLoading)
                }

                Section {
                    Button {
                        Task {
                            await eventsProvider.saveEvent(title: title)
                            dismiss()
                        }
                    } label: {
                        HStack(spacing: 8) {
                            Spacer()
                            if eventsProvider.isLoading {
                                ProgressView()
                            }
                            Text(eventsProvider.isLoading ? "Uploading" : "Upload")
                            Spacer()
                        }
                    }
                    .listRowInsets(EdgeInsets())
                    .frame(maxWidth: .infinity)
                    .disabled(eventsProvider.isLoading)
                }
            }
            .navigationTitle("Add Event")
            .navigationBarTitleDisplayMode(.inline)
            .onChange(of: pickerItem) {
                Task {
                    let result = try? await pickerItem?.loadTransferable(type: ProfileImage.self)
                    selectedImage = result?.image
                    data = result?.data
                }
            }
        }
    }
}

struct ProfileImage: Transferable {
    let image: Image
    let data: Data

    static var transferRepresentation: some TransferRepresentation {
        DataRepresentation(importedContentType: .image) { data in

            guard let uiImage = UIImage(data: data) else {
                throw NSError()
            }
            let image = Image(uiImage: uiImage)
            return ProfileImage(image: image, data: data)
        }
    }
}

//class ImagesUploader {
//
//    private let host: String = "http://happs3.somee.com"
//    private var s3Object: String {
//        host + "/S3Object"
//    }
//
//    func uploadImage(_ imageData: Data, to bucket: String) async throws -> UploadResult {
//        guard let url = URL(string: s3Object + "/Save?BucketName=\(bucket)") else { throw NSError() }
//
//        var urlRequest = URLRequest(url: url)
//        urlRequest.httpMethod = "POST"
//        urlRequest.httpBody = imageData
//        urlRequest.addValue("multipart/form-data", forHTTPHeaderField: "Content-Type")
//
//        let result = try await URLSession.shared.data(for: urlRequest)
//
//        return try JSONDecoder().decode(UploadResult.self, from: result.0)
//    }
//
//    struct UploadResult: Decodable {
//        let key: String
//        let fileName: String
//        let contentType: String
//        let path: String
//    }
//}
