//
//  Event.swift
//
//
//  Created by Alexey Ageev on 04.06.2024.
//

import Foundation

public struct Event: Identifiable {
    public let id: String
    public let media: [Media]
}

extension Event {
    public struct Media {
        public let format: String
        public let source: String
        public let width: Int
        public let length: Int
    }
}
