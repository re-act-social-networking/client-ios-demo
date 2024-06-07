//
//  EventsResult.swift
//
//
//  Created by Alexey Ageev on 04.06.2024.
//

import Foundation

public struct EventsResult: Decodable {
    public let events: [Event]

    public init(events: [Event]) {
        self.events = events
    }
}

extension EventsResult {
    public struct Event: Decodable {
        public let id: String
        public let title: String?
        public let location: Location

        public init(id: String, title: String?, location: Location) {
            self.id = id
            self.title = title
            self.location = location
        }
    }
}

extension EventsResult.Event {
    public struct Location: Decodable {
        public let point: Coordinate

        public init(point: Coordinate) {
            self.point = point
        }
    }
}
