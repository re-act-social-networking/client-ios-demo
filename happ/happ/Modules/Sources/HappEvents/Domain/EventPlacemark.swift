//
//  EventPlacemark.swift
//
//
//  Created by Alexey Ageev on 04.06.2024.
//

import Foundation
import CoreLocation

public struct EventPlacemark: Identifiable, Hashable {
    public let id: String
    public let title: String?
    public let location: CLLocationCoordinate2D
}

extension CLLocationCoordinate2D: Equatable {
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}

extension CLLocationCoordinate2D: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(latitude)
        hasher.combine(longitude)
    }
}
