////
////  AuthLoginView.swift
////  happ
////
////  Created by Alexey Ageev on 20.07.2023.
////
//
//import HappUI
//import SwiftUI
//
//struct AuthLoginView<Configuration: AuthFlowModelConfiguration>: View {
//    @Environment(\.appTheme) var appTheme
//    @ObservedObject var authLoginFlowModel: Configuration
//
//    var body: some View {
//        AuthBaseView {
//            Text(authLoginFlowModel.headerForState)
//                .multilineTextAlignment(.center)
//                .foregroundColor(appTheme.text)
//        } content: {
//            VStack(spacing: 14) {
//                let shownFields = authLoginFlowModel.visibleFields
//                let enabledFields = authLoginFlowModel.enabledFields
//                ForEach(Configuration.Field.allCases, id: \.self) { field in
//                    fieldForItem(field, shownFields: shownFields, enabledFields: enabledFields)
//                }
//
//                HappButton(
//                    label: authLoginFlowModel.nextButtonLabel,
//                    action: {
//                        authLoginFlowModel.proceedToNextStep()
//                    }
//                )
//
//                .controlSize(.large)
//                .disabled(!authLoginFlowModel.isNextButtonAvailable)
//
//                Spacer()
//                AuthFooterView(bottomView: {
//                    HappButton(
//                        label: authLoginFlowModel.alternativeButtonLabel,
//                        action: authLoginFlowModel.alternativeButtonAction
//                    )
//                    .controlSize(.large)
//                })
//            }
//        }
//    }
//
//    @ViewBuilder
//    private func fieldForItem(
//        _ item: Configuration.Field,
//        shownFields: Set<Configuration.Field>,
//        enabledFields: Set<Configuration.Field>
//    ) -> some View {
//        if shownFields.contains(item) {
//            HappTextField(
//                authLoginFlowModel.placeholderForField(item),
//                text: authLoginFlowModel.textBindingForField(item),
//                state: authLoginFlowModel.stateBindingForField(item)
//            )
//            .disabled(!enabledFields.contains(item))
//        }
//    }
//}
//
//#if DEBUG
//struct AuthLoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        AuthLoginView(
//            authLoginFlowModel: AuthLoginFlowModel(
//                authFlowModel: AuthFlowModel()
//            )
//        )
//        .foregroundColor(AppTheme.main.text)
//        .font(HappFont.body)
//    }
//}
//#endif
