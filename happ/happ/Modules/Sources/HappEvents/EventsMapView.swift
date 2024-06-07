//
//  EventsMapView.swift
//
//
//  Created by Alexey Ageev on 04.06.2024.
//

import Foundation
import SwiftUI
import MapKit
import HappUI
import Combine

public struct EventsMapView: View {

    private let client = EventsClient()

    @ObservedObject var eventsProvider: EventsProvider
    @State private var selectedPlacemark: EventPlacemark?

    public init(eventsProvider: EventsProvider) {
        self.eventsProvider = eventsProvider
    }

    public var body: some View {
        Map(selection: $selectedPlacemark) {
            ForEach(eventsProvider.placemarks) { placemark in
                Marker(
                    placemark.title ?? placemark.id,
                    systemImage: "photo.fill",
                    coordinate: placemark.location
                )
                .tint(.gray)
                .tag(placemark)
            }
        }
        .mapStyle(
            .standard(
                elevation: .flat,
                emphasis: .muted,
                pointsOfInterest: .excludingAll,
                showsTraffic: false
            )
        )
        .sheet(item: $selectedPlacemark) { placemark in
            if let event = eventsProvider.events.first(where: { $0.id == placemark.id }),
               let picture = event.media.first(where: { $0.format == "PICTURE" }),
               let url = URL(string: picture.source)
            {
                VStack {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(width: 100, height: 100, alignment: .center)
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .transition(.opacity)
                        case .failure:
                            #if DEBUG
                            Color.red.overlay {
                                Text(picture.source)
                            }
                            #else
                            Text("Loading error")
                            #endif
                        @unknown default:
                            #if DEBUG
                            Color.red.overlay {
                                Text(picture.source)
                            }
                            #else
                            Text("Loading error")
                            #endif
                        }
                    }
                    placemark.title.map {
                        Text($0)
                            .font(HappFont.title)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .environment(\.colorScheme, .dark)
            } else {
                HStack(spacing: 8) {
                    Text("Loading Error")
                }
                .environment(\.colorScheme, .dark)
            }
        }
        .task { await eventsProvider.reloadEvents() }
    }
}
