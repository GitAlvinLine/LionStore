//
//  FirebaseAuthService.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/27/22.
//

import Combine
import Foundation
import FirebaseAuth

enum AuthState {
    case loggedIn
    case loggedOut
}

protocol AuthService {
    typealias UID  = String
    func signIn(with email: String, and password: String) -> AnyPublisher<UID, Error>
    func createUser(with email: String, and password: String) -> AnyPublisher<UID, Error>
    func logOut() -> AnyPublisher<Void, Error>
}

final class FirebaseAuthService: ObservableObject, AuthService {
    @Published var authState: AuthState = .loggedOut
    private let auth: Auth = Auth.auth()
    private var handle: AuthStateDidChangeListenerHandle?
    
    init() {
        addStateDidChangeListener()
    }
    
    deinit {
        removeStateDidChangeListener()
    }
}

// MARK: - Sign In
extension FirebaseAuthService {
    func signIn(with email: String, and password: String) -> AnyPublisher<UID, Error>  {
        Deferred {
            Future { [weak self] promise in
                guard let strongSelf = self else { return }
                strongSelf
                    .auth
                    .signIn(withEmail: email,
                            password: password) { authDataResult, error in
                    promise(
                        FirebaseAuthService
                            .result(authDataResult, error)
                    )
                }
            }
        }
        .eraseToAnyPublisher()
    }
}

// MARK: - Create User
extension FirebaseAuthService {
    func createUser(with email: String, and password: String) -> AnyPublisher<UID, Error> {
        Deferred {
            Future { [weak self] promise in
                guard let strongSelf = self else { return }
                strongSelf
                    .auth
                    .createUser(withEmail: email,
                                password: password) { authDataResult, error in
                    promise(
                        FirebaseAuthService
                            .result(authDataResult, error)
                    )
                }
            }
        }
        .eraseToAnyPublisher()
    }
}

// MARK: - Log Out
extension FirebaseAuthService {
    func logOut() -> AnyPublisher<Void, Error> {
        Deferred {
            Future { [weak self] promise in
                guard let strongSelf = self else { return }
                do {
                    try strongSelf.auth.signOut()
                    promise(.success(()))
                } catch let error {
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}

// MARK: - Helpers
extension FirebaseAuthService {
    private static func result(_ authDataResult: AuthDataResult?, _ error: Error?) -> Result<FirebaseAuthService.UID, Error> {
        if let error = error {
            return .failure(error)
        } else {
            return .success(authDataResult?.user.uid ?? "")
        }
    }
    
    private func addStateDidChangeListener() {
        handle = auth.addStateDidChangeListener { [weak self] _, user in
            guard let strongSelf = self else { return }
            strongSelf.authState = user == nil ? .loggedOut : .loggedIn
        }
    }
    
    private func removeStateDidChangeListener() {
        auth.removeStateDidChangeListener(handle!)
    }
}
