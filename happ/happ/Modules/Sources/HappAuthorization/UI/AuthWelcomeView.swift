//
//  AuthWelcomeView.swift
//
//
//  Created by Alexey Ageev on 10.03.2024.
//

import HappUI
import SwiftUI

public struct AuthWelcomeView: View {

    @Environment(\.appTheme) private var appTheme

    @State private var isInitialState: Bool = true
    @Namespace private var namespace

    public init(
//        authFlowModel: AuthStateMachine
    ) {
//        self.authFlowModel = authFlowModel
    }

    public var body: some View {
        VStack(spacing: .sixModule) {
            Spacer()
            HappLogo(size: .long)
            Text("AuthWelcomeView.Welcome.Promt", bundle: .module)
            Group {
                if isInitialState {
                    HappButton(label: "Начать") { goToSignInOrUp() }
                        .navigationBarBackButtonHidden()
                } else {
                    VStack(spacing: 10) {
                        HappButton(label: "Войти") { goToSignInOrUp() }
                        HappSeparator(text: "or")
                        HappButton(label: "Зарегистрироваться") { goToSignInOrUp() }
                    }
                }
            }
            .padding(.vertical)
            .transition(transition)
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(appTheme.background.ignoresSafeArea())
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }

    private var transition: AnyTransition {
        .move(edge: isInitialState ? .leading : .trailing).combined(with: .opacity)
    }

    private func goToSignInOrUp() {
        withAnimation {
            isInitialState.toggle()
        }
    }
}

extension CGFloat {
    static var sixModule: CGFloat {
        6 * 8
    }
}

struct HappSeparator: View {

    private let text: LocalizedStringKey?

    init(text: LocalizedStringKey? = nil) {
        self.text = text
    }

    var body: some View {
        HStack {
            separator
            if let text {
                Text(text, bundle: .module, comment: "used in separator in auth screens")
                separator
            }
        }
    }

    private var separator: some View {
        Rectangle()
            .frame(height: 1)
    }
}

extension AnyTransition {
    public static func + (lhs: AnyTransition, rhs: AnyTransition) -> AnyTransition {
        lhs.combined(with: rhs)
    }
}
