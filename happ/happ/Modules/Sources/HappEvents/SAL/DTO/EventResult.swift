//
//  EventResult.swift
//  
//
//  Created by Alexey Ageev on 04.06.2024.
//

import Foundation

struct EventResult: Decodable {
    let id: Event.ID
    let media: [MediaDTO]
}
