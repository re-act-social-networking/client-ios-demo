////
////  AuthLoginModel.swift
////  happ
////
////  Created by Alexey Ageev on 21.07.2023.
////
//
//import HappUI
//import SwiftUI
//
//protocol AuthLoginFlowModelDelegate: AnyObject {
//    func authLoginFlowModelDidFinishLoginProcess(_: AuthLoginFlowModel)
//}
//
//public class AuthLoginFlowModel: AuthFlowModelConfiguration {
//    private weak var authFlowModel: AuthFlowModel?
//
//    init(authFlowModel: AuthFlowModel) {
//        self.authFlowModel = authFlowModel
//    }
//
//    @Published var email: String = ""
//    @Published var emailFieldState: HappTextField.State = .normal
//
//    @Published var password: String = ""
//    @Published var passwordFieldState: HappTextField.State = .normal
//
//    private var state: State = .emailEntering
//
//    var nextButtonLabel: LocalizedStringKey {
//        "Далее"
//    }
//
//    var alternativeButtonLabel: LocalizedStringKey {
//        "create new account (action)"
//    }
//
//    lazy var alternativeButtonAction: () -> Void = { [weak self] in
//        self?.authFlowModel?.handleAction(.beginRegistration)
//    }
//
//    var isNextButtonAvailable: Bool {
//        switch state {
//        case .emailEntering:
//            return !email.isEmpty
//        case .passwordEntering:
//            return !password.isEmpty
//        }
//    }
//
//    var visibleFields: Set<Field> {
//        switch state {
//        case .emailEntering:
//            return [.email]
//        case .passwordEntering:
//            return [.email, .password]
//        }
//    }
//
//    var enabledFields: Set<Field> {
//        switch state {
//        case .emailEntering:
//            return [.email]
//        case .passwordEntering:
//            return [.password]
//        }
//    }
//
//    var headerForState: LocalizedStringKey {
//        switch state {
//        case .emailEntering:
//            return "Введите адрес электронной почты или имя пользователя"
//        case .passwordEntering:
//            return "Введите пароль"
//        }
//    }
//
//    func proceedToNextStep() {
//        switch state {
//        case .emailEntering:
//            state = .passwordEntering
//        case .passwordEntering:
//            authFlowModel?.handleAction(.beginRegistration)
//        }
//    }
//
//    private func validate() {
//
//    }
//
//    func placeholderForField(_ item: Field) -> LocalizedStringKey {
//        switch item {
//        case .email:
//            return "Email / имя пользователя"
//        case .password:
//            return "Пароль"
//        }
//    }
//
//    func textBindingForField(_ item: Field) -> Binding<String> {
//        switch item {
//        case .email:
//            return binding(keyPath: \.email)
//        case .password:
//            return binding(keyPath: \.password)
//        }
//    }
//
//    func stateBindingForField(_ item: Field) -> Binding<HappTextField.State> {
//        switch item {
//        case .email:
//            return binding(keyPath: \.emailFieldState)
//        case .password:
//            return binding(keyPath: \.passwordFieldState)
//        }
//    }
//}
//
//extension AuthLoginFlowModel {
//    enum State {
//        case emailEntering
//        case passwordEntering
//    }
//
//    enum Field: CaseIterable {
//        case email
//        case password
//    }
//}
