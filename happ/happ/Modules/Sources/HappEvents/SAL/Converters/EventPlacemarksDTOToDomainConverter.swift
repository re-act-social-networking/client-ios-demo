//
//  EventsDTOToDomainConverter.swift
//
//
//  Created by Alexey Ageev on 04.06.2024.
//

import Foundation
import CoreLocation

enum EventPlacemarksDTOToDomainConverter {
    static func convert(_ eventsResult: EventsResult) -> [EventPlacemark] {
        eventsResult.events.map { EventPlacemark(id: $0.id, title: $0.title, location: convert($0.location)) }
    }

    private static func convert(_ location: EventsResult.Event.Location) -> CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: location.point.latitude, longitude: location.point.longitude)
    }
}
