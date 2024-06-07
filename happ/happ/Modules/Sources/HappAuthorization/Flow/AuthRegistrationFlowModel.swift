////
////  AuthRegistrationFlowModel.swift
////  happ
////
////  Created by Alexey Ageev on 21.07.2023.
////
//
//import HappUI
//import SwiftUI
//
//protocol AuthRegistrationFlowModelDelegate: AnyObject {
//    func authRegistrationFlowModelDidFinishLoginProcess(_: AuthRegistrationFlowModel)
//}
//
//public class AuthRegistrationFlowModel: AuthFlowModelConfiguration {
//    private weak var authFlowModel: AuthFlowModel?
//
//    init(authFlowModel: AuthFlowModel) {
//        self.authFlowModel = authFlowModel
//    }
//
//    weak var delegate: AuthRegistrationFlowModelDelegate?
//
//    @Published var name: String = ""
//    @Published var nameFieldState: HappTextField.State = .normal
//
//    @Published var email: String = ""
//    @Published var emailFieldState: HappTextField.State = .normal
//
//    @Published var birthday: String = ""
//    @Published var birthdayFieldState: HappTextField.State = .normal
//
//    @Published var password: String = ""
//    @Published var passwordFieldState: HappTextField.State = .normal
//
//    @Published var confirmPassword: String = ""
//    @Published var confirmPasswordFieldState: HappTextField.State = .normal
//
//    private var state: State = .nameEmailAndBirthdayEntering
//
//    var isNextButtonAvailable: Bool {
//        switch state {
//        case .nameEmailAndBirthdayEntering:
//            return !(name.isEmpty || email.isEmpty || birthday.isEmpty)
//        case .passwordsEntering:
//            return !password.isEmpty && password == confirmPassword
//        }
//    }
//    let nextButtonLabel: LocalizedStringKey = "log in verb"
//
//    var alternativeButtonLabel: LocalizedStringKey = "create new account (action)"
//
//    lazy var alternativeButtonAction: () -> Void = { [weak self] in
//        self?.authFlowModel?.handleAction(.beginLogin)
//    }
//
//    var visibleFields: Set<Field> {
//        switch state {
//        case .nameEmailAndBirthdayEntering:
//            return [.name, .email, .birthday]
//        case .passwordsEntering:
//            return [.password, .confirmPassword]
//        }
//    }
//
//    var enabledFields: Set<Field> {
//        switch state {
//        case .nameEmailAndBirthdayEntering:
//            return [.name, .email, .birthday]
//        case .passwordsEntering:
//            return [.password, .confirmPassword]
//        }
//    }
//
//    var headerForState: LocalizedStringKey {
//        switch state {
//        case .nameEmailAndBirthdayEntering:
//            return "Создайте учётную запись"
//        case .passwordsEntering:
//            return "Придумайте пароль"
//        }
//    }
//
//    func proceedToNextStep() {
//        switch state {
//        case .nameEmailAndBirthdayEntering:
//            state = .passwordsEntering
//        case .passwordsEntering:
//            delegate?.authRegistrationFlowModelDidFinishLoginProcess(self)
//        }
//    }
//
//    private func validate() {
//
//    }
//
//    func placeholderForField(_ item: Field) -> LocalizedStringKey {
//        switch item {
//        case .name:
//            return "Имя"
//        case .email:
//            return "Email"
//        case .birthday:
//            return "Дата рождения"
//
//        case .password:
//            return "Пароль"
//        case .confirmPassword:
//            return "Повторите пароль"
//        }
//    }
//
//    func textBindingForField(_ item: Field) -> Binding<String> {
//        switch item {
//        case .name:
//            return binding(keyPath: \.name)
//        case .email:
//            return binding(keyPath: \.email)
//        case .birthday:
//            return binding(keyPath: \.birthday)
//
//        case .password:
//            return binding(keyPath: \.password)
//        case .confirmPassword:
//            return binding(keyPath: \.confirmPassword)
//        }
//    }
//
//    func stateBindingForField(_ item: Field) -> Binding<HappTextField.State> {
//        switch item {
//        case .name:
//            return binding(keyPath: \.nameFieldState)
//        case .email:
//            return binding(keyPath: \.emailFieldState)
//        case .birthday:
//            return binding(keyPath: \.birthdayFieldState)
//
//        case .password:
//            return binding(keyPath: \.passwordFieldState)
//        case .confirmPassword:
//            return binding(keyPath: \.confirmPasswordFieldState)
//        }
//    }
//}
//
//extension AuthRegistrationFlowModel: Equatable {
//    public static func == (lhs: AuthRegistrationFlowModel, rhs: AuthRegistrationFlowModel) -> Bool {
//        lhs.email == rhs.email && lhs.password == rhs.password
//    }
//}
//
//extension AuthRegistrationFlowModel: Hashable {
//    public func hash(into hasher: inout Hasher) {
//        hasher.combine(email)
//        hasher.combine(password)
//    }
//
//    enum State {
//        case nameEmailAndBirthdayEntering
//        case passwordsEntering
//    }
//
//    enum Field: CaseIterable {
//        case name
//        case email
//        case birthday
//
//        case password
//        case confirmPassword
//    }
//}
