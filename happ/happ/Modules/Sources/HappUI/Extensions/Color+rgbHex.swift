//
//  Color+rgbHex.swift
//  happ
//
//  Created by Alexey Ageev on 17.07.2023.
//

import SwiftUI

extension Color {
    public init(
        rgbHex: Int,
        opacity: CGFloat = 1
    ) {
        let red: CGFloat = CGFloat((rgbHex >> 16) & 0xFF) / CGFloat(0xFF)
        let green: CGFloat = CGFloat((rgbHex >> 8) & 0xFF) / CGFloat(0xFF)
        let blue: CGFloat = CGFloat((rgbHex >> 0) & 0xFF) / CGFloat(0xFF)

        self.init(red: red, green: green, blue: blue, opacity: opacity)
    }
}
