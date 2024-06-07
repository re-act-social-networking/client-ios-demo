//
//  DynamicColor.swift
//  happ
//
//  Created by Alexey Ageev on 03.03.2023.
//

import SwiftUI

public struct DynamicColor: View {
    @Environment(\.colorScheme) var colorScheme
    let light: Color
    let dark: Color

    init(light: Color, dark: Color) {
        self.light = light
        self.dark = dark
    }

    init(staticColor: Color) {
        self.light = staticColor
        self.dark = staticColor
    }

    public var body: some View {
        self.resolved(by: colorScheme)
    }

    #warning("Extract dark mode forcing to external config")
    public func resolved(by colorScheme: ColorScheme) -> Color {
        return dark
//        switch colorScheme {
//        case .light:
//            return light
//        case .dark:
//            return dark
//        @unknown default:
//            fatalError("Support new colorScheme")
//        }
    }
}
