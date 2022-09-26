//
//  FirebaseAuthLoader.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/24/22.
//

import Foundation

final public class FirebaseAuthLoader {
    private let credentials: LoginCredentials
    private let client: FirebaseAuthClient
    
    public enum Error: Swift.Error {
        case firebaseAuthError
    }
    
    public enum Result: Equatable {
        case success(AuthUser)
        case failure(Error)
    }
    
    public init(credentials: LoginCredentials, client: FirebaseAuthClient) {
        self.client = client
        self.credentials = credentials
    }
    
    public func signIn(completion: @escaping (Result) -> Void) {
        client.signIn(with: credentials) { [weak self] result in
            guard self != nil else { return }
            
            switch result {
            case .success(let uid):
                completion(AuthUserMapper.map(uid))
            case .failure:
                completion(.failure(.firebaseAuthError))
            }
        }
    }
}
