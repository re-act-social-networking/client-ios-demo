//
//  AppTheme.swift
//  happ
//
//  Created by Alexey Ageev on 03.03.2023.
//

import SwiftUI

public struct AppTheme {
    public let background: DynamicColor
    public let text: DynamicColor
    public let textMinor: DynamicColor
    public let textInvert: DynamicColor
    public let secondary: DynamicColor
    public let textFieldBackground: DynamicColor
    public let accent: DynamicColor
    public let error: DynamicColor

    public static let main = AppTheme(
        background: DynamicColor(light: .white, dark: ColorPalette.dark),
        text: DynamicColor(light: .black, dark: .white),
        textMinor: DynamicColor(staticColor: ColorPalette.disabled),
        textInvert: DynamicColor(staticColor: .black),
        secondary: DynamicColor(staticColor: .gray),
        textFieldBackground: DynamicColor(light: Color(uiColor: .systemGray6), dark: .white),
        accent: DynamicColor(staticColor: ColorPalette.blue2),
        error: DynamicColor(staticColor: ColorPalette.red)
    )
}
