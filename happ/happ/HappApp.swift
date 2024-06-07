//
//  HappApp.swift
//  happ
//
//  Created by Alexey Ageev on 03.03.2023.
//

import HappUI
import SwiftUI

@main
struct HappApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.colorScheme, .dark)
                .tint(AppTheme.main.text)
                .font(HappFont.body)
        }
    }
}
