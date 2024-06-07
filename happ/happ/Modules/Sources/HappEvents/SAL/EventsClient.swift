//
//  EventsClient.swift
//  
//
//  Created by Alexey Ageev on 04.06.2024.
//

import Foundation

public final class EventsClient {
    private let host: String = "http://193.187.96.54:8082"

    private var events: String { host + "/events" }
    private var event: String { host + "/event" }

    private lazy var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()

    private lazy var encoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }()

    public init() {}

    public func requestEvents(body: EventsParams) async throws -> [EventPlacemark] {
        guard let url = URL(string: events) else { throw NSError() }

        var request = URLRequest(url: url)
        request.httpBody = try encoder.encode(body)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let result = try await URLSession.shared.data(for: request)
        let eventsResult = try decoder.decode(EventsResult.self, from: result.0)

        return EventPlacemarksDTOToDomainConverter.convert(eventsResult)
    }

    public func requestEventData(id: Event.ID) async throws -> Event {
        guard let url = URL(string: event + "/\(id)") else { throw NSError() }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let result = try await URLSession.shared.data(for: request)
        let eventResult = try decoder.decode(EventResult.self, from: result.0)

        return EventDTOToDomainConverter.convert(eventResult)
    }

    public func createEvent(_ params: CreateEventParams) async throws {
        guard let url = URL(string: event + "/create") else { throw NSError() }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try encoder.encode(params)

        _ = try await URLSession.shared.data(for: request)
    }
}
