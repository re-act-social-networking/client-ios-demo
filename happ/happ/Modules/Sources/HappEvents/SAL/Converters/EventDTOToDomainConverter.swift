//
//  EventDTOToDomainConverter.swift
//
//
//  Created by Alexey Ageev on 04.06.2024.
//

import Foundation

enum EventDTOToDomainConverter {
    static func convert(_ eventResult: EventResult) -> Event {
        Event(id: eventResult.id, media: convert(eventResult.media))
    }

    private static func convert(_ media: [MediaDTO]) -> [Event.Media] {
        media.map { Event.Media(format: $0.format, source: $0.src, width: $0.width, length: $0.length) }
    }
}
