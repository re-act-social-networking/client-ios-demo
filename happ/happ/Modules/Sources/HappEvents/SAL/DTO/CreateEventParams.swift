//
//  CreateEventParams.swift
//
//
//  Created by Alexey Ageev on 06.06.2024.
//

import Foundation

public struct CreateEventParams: Encodable {
    public let title: String
    public let description: String?
//    public let owner: String
    public let location: Coordinate
    public let media: [MediaDTO]

    public let owner = [
        "2ab49b55-5379-43f7-b583-f091ab45e79d",
        "07f5cc48-7fa5-4626-88c2-7ae4867f888d",
        "a0a7cb0d-0b36-4df0-8b2e-d73d89103e7f",
        "8793ef45-9b3e-464f-aa05-9d2b3d67bc1d",
        "9cfdef2b-0eac-411d-b88c-bbd8f4b70c98",
    ].randomElement()!

    public init(title: String, description: String?, /*owner: String,*/ location: Coordinate, media: [MediaDTO]) {
        self.title = title
        self.description = description
        self.location = location
        self.media = media
    }
}
