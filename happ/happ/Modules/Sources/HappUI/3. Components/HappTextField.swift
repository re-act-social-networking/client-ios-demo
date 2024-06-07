//
//  HappTextField.swift
//  happ
//
//  Created by Alexey Ageev on 21.07.2023.
//

import SwiftUI

public struct HappTextField: View {

    @Environment(\.appTheme) var appTheme
    @Environment(\.isEnabled) var isEnabled
    @Environment(\.isFocused) var isFocused

    private let titleKey: LocalizedStringKey
    private var text: Binding<String>
    private let prompt: Text?
    private let axis: Axis
    private var state: Binding<State>

    public init(
        _ titleKey: LocalizedStringKey,
        text: Binding<String>,
        prompt: Text? = nil,
        axis: Axis = .horizontal,
        state: Binding<State>
    ) {
        self.titleKey = titleKey
        self.text = text
        self.prompt = prompt
        self.axis = axis
        self.state = state
    }

    public var body: some View {

        TextField(titleKey, text: text, prompt: prompt, axis: axis)
            .disabled(!isEnabled)
            .foregroundColor(foregroundColor())
            .environment(\.colorScheme, .light)
            .padding(.horizontal, 21)
            .padding(.vertical, 11)
            .frame(minHeight: 44)
            .background(
                ZStack {
                    HappControlShape()
                        .foregroundColor(appTheme.textFieldBackground)
                    if let strokeColor = strokeColor() {
                        HappControlShape()
                            .stroke(lineWidth: 2)
                            .foregroundColor(strokeColor)
                    }
                }
            )
    }

    private func strokeColor() -> DynamicColor? {
        guard !isFocused else {
            return appTheme.accent
        }
        switch state.wrappedValue {
        case .error:
            return appTheme.error
        case .normal:
            return nil
        }
    }

    private func foregroundColor() -> DynamicColor {
        isEnabled ? appTheme.textInvert : appTheme.textMinor
    }
}

extension HappTextField {
    public enum State {
        case error
        case normal
    }
}

#if DEBUG
struct HappTextField_Previews: PreviewProvider {
    @FocusState static var isFocused

    static var previews: some View {
        VStack(spacing: 28) {
            HappTextField("Text", text: .constant(""), state: .constant(.normal))
            HappTextField("Text", text: .constant("Text"), state: .constant(.normal))
            HappTextField("Text", text: .constant("Text"), state: .constant(.normal))
                .focused($isFocused)
            HappTextField("Text", text: .constant("Text"), state: .constant(.error))
        }
        .padding()
        .background(AppTheme.main.background.ignoresSafeArea())
    }
}
#endif
