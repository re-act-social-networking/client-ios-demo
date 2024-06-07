//
//  foregroundColor + DynamicColor.swift
//  happ
//
//  Created by Alexey Ageev on 04.03.2023.
//

import SwiftUI

public struct DynamicForegroundColor: ViewModifier {
    @Environment(\.colorScheme) private var colorScheme
    let dynamicColor: DynamicColor

    public func body(content: Content) -> some View {
        content
            .foregroundColor(dynamicColor.resolved(by: colorScheme))
    }
}

extension View {
    public func foregroundColor(_ dynamicColor: DynamicColor) -> some View {
        modifier(DynamicForegroundColor(dynamicColor: dynamicColor))
    }
}
