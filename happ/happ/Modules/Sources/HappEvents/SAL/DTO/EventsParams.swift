//
//  EventsParams.swift
//
//
//  Created by Alexey Ageev on 04.06.2024.
//

import Foundation

public struct EventsParams: Encodable {
    public let rect: Rect

    public init(rect: Rect) {
        self.rect = rect
    }
}

extension EventsParams {
    public struct Rect: Encodable {
        public let bottomLeft: Coordinate
        public let topRight: Coordinate

        public init(bottomLeft: Coordinate, topRight: Coordinate) {
            self.bottomLeft = bottomLeft
            self.topRight = topRight
        }
    }
}

extension EventsParams.Rect {
    public struct Coordinate: Encodable {
        public let latitude: Double
        public let longitude: Double

        public init(latitude: Double, longitude: Double) {
            self.latitude = latitude
            self.longitude = longitude
        }
    }
}
