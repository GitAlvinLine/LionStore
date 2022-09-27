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
    
    private let firebaseAuth: AuthService
    private var cancellables = Set<AnyCancellable>()
    
    init(_ authService: AuthService) {
        self.firebaseAuth = authService
    }
}

// MARK: - Log In User
extension SignInViewModel {
    func logIn() {
        firebaseAuth
            .signIn(with: user.email, and: user.password)
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
