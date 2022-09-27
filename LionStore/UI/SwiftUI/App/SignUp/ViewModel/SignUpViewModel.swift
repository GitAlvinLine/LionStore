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
    
    private(set) var firebaseAuth: AuthService
    private var cancellables = Set<AnyCancellable>()
    
    init(_ authService: AuthService) {
        self.firebaseAuth = authService
    }
}

// MARK: - Sign Up User
extension SignUpViewModel {
    func createUser() {
        firebaseAuth
            .createUser(with: user.email, and: user.password)
            .sink { result in
                switch result {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { _ in
                
            }
            .store(in: &cancellables)
    }
}
