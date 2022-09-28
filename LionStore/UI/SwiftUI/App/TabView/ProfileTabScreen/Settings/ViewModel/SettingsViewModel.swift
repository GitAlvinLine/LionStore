//
//  SettingsViewModel.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/27/22.
//

import Combine
import Foundation

final class SettingsViewModel: ObservableObject {
    private let firebaseAuth: AuthService
    private var cancellables = Set<AnyCancellable>()
    
    init(_ authService: AuthService) {
        self.firebaseAuth = authService
    }
}

// MARK: - Log Out User
extension SettingsViewModel {
    func logOut() {
        firebaseAuth
            .logOut()
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
