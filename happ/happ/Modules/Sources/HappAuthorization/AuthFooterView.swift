//
//  AuthFooterView.swift
//  happ
//
//  Created by Alexey Ageev on 17.07.2023.
//

import HappUI
import SwiftUI

struct AuthFooterView<TopView: View, BottomView: View>: View {
    @Environment(\.appTheme) var appTheme
    let topView: (() -> TopView)?
    let bottomView: (() -> BottomView)?

    init(
        @ViewBuilder topView: @escaping () -> TopView,
        @ViewBuilder bottomView: @escaping () -> BottomView
    ) {
        self.topView = topView
        self.bottomView = bottomView
    }

    init(
        @ViewBuilder topView: @escaping () -> TopView
    ) {
        self.topView = topView
        self.bottomView = nil
    }

    init(
        @ViewBuilder bottomView: @escaping () -> BottomView
    ) where TopView == AnyView {
        self.topView = nil
        self.bottomView = bottomView
    }

    var body: some View {
        VStack(spacing: 12) {
            topView?()
            HStack {
                Rectangle()
                    .frame(height: 1)
                Text("or", comment: "used in separator in auth screens")
                Rectangle()
                    .frame(height: 1)
            }
            .foregroundColor(appTheme.secondary)
            .frame(height: 22)
            bottomView?()
        }
        .padding(.bottom, 12)
    }
}

#if DEBUG
struct AuthFooterView_Previews: PreviewProvider {
    static var previews: some View {
        AuthFooterView {
            HappButton(label: "log in verb") {}
                .font(HappFont.body.weight(.semibold))
        } bottomView: {
            HappButton(label: "create new account (action)") {}
        }
        .controlSize(.large)
        .padding()
        .background(AppTheme.main.background)
        .previewLayout(.sizeThatFits)
        .font(HappFont.body)
    }
}
#endif
