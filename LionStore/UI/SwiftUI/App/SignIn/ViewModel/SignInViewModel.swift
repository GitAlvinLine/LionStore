//
//  SignInViewModel.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/27/22.
//

import Combine
import Foundation

final class SignInViewModel: ObservableObject {
    @Published var user: LoginUser = LoginUser()
    @Published var showPassword: Bool = false
    @Published var isLoading: Bool = false
    @Published var alert: Alerting = Alerting()
    
    private let firebaseAuth: AuthService
    private var cancellables = Set<AnyCancellable>()
    
    init(_ authService: AuthService) {
        self.firebaseAuth = authService
    }
}

// MARK: - Log In User
extension SignInViewModel {
    func logIn() {
        self.toggleProgressView()
        firebaseAuth
            .signIn(with: user.email, and: user.password)
            .sink { [weak self] result in
                guard let strongSelf = self else { return }
                switch result {
                case .finished:
                    strongSelf.toggleProgressView()
                    break
                case .failure(let error):
                    strongSelf.toggleProgressView()
                    strongSelf.alert.showAlert(error)
                }
            } receiveValue: { _ in
                
            }
            .store(in: &cancellables)
    }
}

// MARK: - Helpers
// MARK: - Loading User
extension SignInViewModel {
    private func toggleProgressView() {
        isLoading.toggle()
    }
}
