//
//  AppThemeKey.swift
//  happ
//
//  Created by Alexey Ageev on 17.07.2023.
//

import SwiftUI

struct AppThemeKey: EnvironmentKey {
    static let defaultValue = AppTheme.main
}

extension EnvironmentValues {
    public var appTheme: AppTheme {
        get { self[AppThemeKey.self] }
        set { self[AppThemeKey.self] = newValue }
    }
}
