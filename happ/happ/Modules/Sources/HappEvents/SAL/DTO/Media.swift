//
//  Media.swift
//
//
//  Created by Alexey Ageev on 06.06.2024.
//

import Foundation

public struct MediaDTO: Codable {
    let format: String
    let src: String
    let width: Int
    let length: Int
}
