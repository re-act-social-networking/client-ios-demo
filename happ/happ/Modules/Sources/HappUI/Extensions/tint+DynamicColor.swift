//
//  DynamicTint.swift
//  happ
//
//  Created by Alexey Ageev on 19.07.2023.
//

import SwiftUI

public struct DynamicTint: ViewModifier {
    @Environment(\.colorScheme) private var colorScheme
    let dynamicColor: DynamicColor

    public func body(content: Content) -> some View {
        content
            .tint(dynamicColor.resolved(by: colorScheme))
    }
}

extension View {
    public func tint(_ dynamicColor: DynamicColor) -> some View {
        modifier(DynamicTint(dynamicColor: dynamicColor))
    }
}
