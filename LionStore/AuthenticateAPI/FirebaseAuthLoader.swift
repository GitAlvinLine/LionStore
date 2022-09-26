//
//  FirebaseAuthLoader.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/24/22.
//

import Foundation

public enum FirebaseAuthClientResult {
    public typealias UID = String
    case success(UID)
    case failure(Error)
}

public protocol FirebaseAuthClient {
    func signIn(with credentials: LoginCredentials, completion: @escaping (FirebaseAuthClientResult) -> Void)
}

final public class FirebaseAuthLoader {
    private let credentials: LoginCredentials
    private let client: FirebaseAuthClient
    
    public enum Error: Swift.Error {
        case connectivity
        case firebaseAuthError
    }
    
    public init(credentials: LoginCredentials, client: FirebaseAuthClient) {
        self.client = client
        self.credentials = credentials
    }
    
    public func signIn(completion: @escaping (Error) -> Void) {
        client.signIn(with: credentials) { result in
            switch result {
            case .success:
                completion(.firebaseAuthError)
            case .failure:
                completion(.connectivity)
            }
        }
    }
}
