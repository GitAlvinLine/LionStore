//
//  SignUpViewModel.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/27/22.
//

import SwiftUI
import Combine

final class SignUpViewModel: ObservableObject {
    @Published var user: CreateUser = CreateUser()
    @Published var showPassword: Bool = false
    @Published var isLoading: Bool = false
    @Published var alert: Alerting = Alerting()
    
    private(set) var firebaseAuth: AuthService
    private var cancellables = Set<AnyCancellable>()
    
    init(_ authService: AuthService) {
        self.firebaseAuth = authService
    }
}

// MARK: - Sign Up User
extension SignUpViewModel {
    func createUser() {
        self.toggleProgressView()
        firebaseAuth
            .createUser(with: user.email, and: user.password)
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
extension SignUpViewModel {
    private func toggleProgressView() {
        self.isLoading.toggle()
    }
}
