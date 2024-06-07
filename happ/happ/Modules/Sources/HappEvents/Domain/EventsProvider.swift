//
//  EventsProvider.swift
//
//
//  Created by Alexey Ageev on 07.06.2024.
//

import Foundation

public final class EventsProvider: ObservableObject {
    @Published public var placemarks: [EventPlacemark] = []
    @Published public var events: [Event] = []
    @Published public var isLoading: Bool = false

    private let client = EventsClient()

    public init() {}

    public func reloadEvents() async {
        isLoading = true
        defer { isLoading = false }

        let placemarks = try? await self.client.requestEvents(
            body: EventsParams(
                rect: EventsParams.Rect(
                    bottomLeft: EventsParams.Rect.Coordinate(latitude: 58.0, longitude: 29.0),
                    topRight: EventsParams.Rect.Coordinate(latitude: 61.0, longitude: 32.0)
                )
            )
        )

        guard let placemarks else { return }

        self.placemarks = placemarks
        let events = try? await withThrowingTaskGroup(of: Event.self) { group -> [Event] in
            placemarks.forEach { placemark in
                group.addTask { [self] in
                    return try await client.requestEventData(id: placemark.id)
                }
            }

            return try await group.reduce(into: []) { $0.append($1) }
        }
        guard let events else { return }
        self.events = events
    }

    public func saveEvent(title: String) async {
        isLoading = true
        defer { isLoading = false }

        try? await client.createEvent(
            CreateEventParams(
                title: title,
                description: nil,
                location: Coordinate(
                    latitude: .random(in: 59.93773...59.9726),
                    longitude: .random(in: 30.3026...30.37538)
                ),
                media: []
            )
        )

        await reloadEvents()
    }
}
