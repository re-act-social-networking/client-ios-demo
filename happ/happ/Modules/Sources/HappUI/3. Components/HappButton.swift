//
//  HappButton.swift
//  happ
//
//  Created by Alexey Ageev on 17.07.2023.
//

import SwiftUI

public struct HappButton: View {
    public typealias Action = () -> Void

    @Environment(\.appTheme) var colorScheme
    @Environment(\.controlSize) var controlSize
    @Environment(\.isEnabled) var isEnabled
    @Environment(\.font) var font

    private let text: LocalizedStringKey
    private let action: Action

    public init(
        label: LocalizedStringKey,
        action: @escaping Action
    ) {
        self.text = label
        self.action = action
    }

    public var body: some View {
        Button(action: action, label: label)
            .disabled(!isEnabled)
            .foregroundColor(foregroundColor)
    }

    private func label() -> some View {
        Text(text)
            .font(font)
            .frame(height: height)
            .frame(maxWidth: .infinity)
            .background {
                HappControlShape()
                    .stroke(lineWidth: strokeLineWidth)
            }
    }

    private var height: CGFloat {
        44
//        switch controlSize {
//        case .large:
//            return 44
//        case .mini, .small, .regular:
//            assertionFailure("such sizes are not supported in design system")
//            return 44
//        #if canImport(TipKit) // Basically, equals to #available(iOS 17.0, *), but as macro
//        case .extraLarge:
//            assertionFailure("such sizes are not supported in design system")
//            return 44
//        #endif
//        @unknown default:
//            assertionFailure("such sizes are not supported in design system")
//            return 44
//        }
    }

    private var strokeLineWidth: CGFloat {
        1
    }

    private var foregroundColor: DynamicColor {
        isEnabled ? colorScheme.text : colorScheme.secondary
    }
}

#if DEBUG
struct HappButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .leading, spacing: 28) {
            HappButton(label: "Text", action: {})
            HappButton(label: "Text", action: {})
            HappButton(label: "Text", action: {})
                .disabled(true)
        }
        .controlSize(.large)
        .padding()
        .background(AppTheme.main.background)
        .previewLayout(.sizeThatFits)
    }
}
#endif
