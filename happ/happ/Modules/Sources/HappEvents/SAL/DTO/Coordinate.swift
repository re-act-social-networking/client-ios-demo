//
//  Coordinate.swift
//
//
//  Created by Alexey Ageev on 06.06.2024.
//

import Foundation

public struct Coordinate: Codable {
    public let latitude: Double
    public let longitude: Double

    public init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
