////
////  AuthFlowModel.swift
////  happ
////
////  Created by Alexey Ageev on 17.07.2023.
////
//
//import HappUI
//import SwiftUI
//
//@Observable
//public class AuthStateMachine {
//
//    private static let initialState = AuthState.welcome(Welcome(isInitialState: true))
//
//    @ObservationIgnored var shouldShowBackButton: Bool {
//        guard let last = stateStack.last else { return false }
//
//        if case .welcome = last {
//            return false
//        }
//
//        return false
//    }
//
//    var stateStack: [AuthState] = []
//
//    public init() {}
//
////    public func makeAuthLoginFlowModel() -> AuthLoginFlowModel {
////        AuthLoginFlowModel(authFlowModel: self)
////    }
////
////    public func makeAuthRegistrationFlowModel() -> AuthRegistrationFlowModel {
////        AuthRegistrationFlowModel(authFlowModel: self)
////    }
//
//    public func handleNext() {
//        switch currentState {
//        case .welcome(let welcome):
//            var stateSnapshot = stateStack
//            _ = stateSnapshot.popLast()
//            stateSnapshot.append(.welcome(Welcome(isInitialState: !welcome.isInitialState)))
//            stateStack = stateSnapshot
//        }
//    }
//}
//
//extension AuthStateMachine {
//    public enum AuthState: Hashable {
//        case welcome(Welcome)
////        case loginBase
////        case registrationBase
//    }
//}
//
//extension AuthStateMachine {
//    public struct Welcome: Hashable {
//        let isInitialState: Bool
//    }
//}
////
////// MARK: Action interface
////
////extension AuthFlowModel {
////    enum Action {
////        case beginLogin
////        case beginRegistration
////    }
////
////    func handleAction(_ action: Action) {
////        switch (stateStack.last, action) {
////        case (.none, .beginLogin): beginLogin()
////        case (.none, .beginRegistration): beginRegistration()
////
////        case (.login, .beginLogin): sameStateTransition()
////        case (.login, .beginRegistration): loginToRegistration()
////
////        case (.registration, .beginLogin): registrationToLogin()
////        case (.registration, .beginRegistration): sameStateTransition()
////        }
////    }
////}
////
////// MARK: Action handling
////extension AuthFlowModel {
////    private func sameStateTransition() {
////        assertionFailure("Same state transition is considered to be error")
////    }
////
////    private func beginLogin() {
////        stateStack.removeAll()
////        stateStack.append(.login)
////    }
////
////    private func beginRegistration() {
////        stateStack.removeAll()
////        stateStack.append(.registration)
////    }
////
////    private func loginToRegistration() {
////        beginRegistration()
////    }
////
////    private func registrationToLogin() {
////        beginLogin()
////    }
////}
////
////extension AuthFlowModel: AuthLoginFlowModelDelegate {
////    func authLoginFlowModelDidFinishLoginProcess(_: AuthLoginFlowModel) {
////        stateStack = []
////    }
////}
////
////extension AuthFlowModel: AuthRegistrationFlowModelDelegate {
////    func authRegistrationFlowModelDidFinishLoginProcess(_: AuthRegistrationFlowModel) {
////        stateStack = []
////    }
////}
////
////protocol AuthFlowModelConfiguration: AnyObject, ObservableObject {
////    associatedtype State
////    associatedtype Field: CaseIterable, Hashable where Field.AllCases: RandomAccessCollection
////
////    var visibleFields: Set<Field> { get }
////    var enabledFields: Set<Field> { get }
////    var headerForState: LocalizedStringKey { get }
////
////    var isNextButtonAvailable: Bool { get }
////    var nextButtonLabel: LocalizedStringKey { get }
////
////    var alternativeButtonLabel: LocalizedStringKey { get }
////    var alternativeButtonAction: () -> Void { get }
////
////    func proceedToNextStep()
////
////    func placeholderForField(_: Field) -> LocalizedStringKey
////    func textBindingForField(_: Field) -> Binding<String>
////    func stateBindingForField(_: Field) -> Binding<HappTextField.State>
////}
////
////extension AuthFlowModelConfiguration {
////    func binding<Value>(keyPath: WritableKeyPath<Self, Value>) -> Binding<Value> {
////        Binding(
////            get: { [unowned self] in
////                self[keyPath: keyPath]
////            },
////            set: { [weak self] in
////                self?[keyPath: keyPath] = $0
////            }
////        )
////    }
////}
