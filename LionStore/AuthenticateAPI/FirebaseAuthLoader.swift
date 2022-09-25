//
//  FirebaseAuthLoader.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/24/22.
//

import Foundation

public protocol FirebaseAuthClient {
    func signIn(with credentials: LoginCredentials, completion: @escaping (Error) -> Void)
}

final public class FirebaseAuthLoader {
    private let credentials: LoginCredentials
    private let client: FirebaseAuthClient
    
    public enum Error: Swift.Error {
        case connectivity
    }
    
    public init(credentials: LoginCredentials, client: FirebaseAuthClient) {
        self.client = client
        self.credentials = credentials
    }
    
    public func signIn(completion: @escaping (Error) -> Void = { _ in }) {
        client.signIn(with: credentials) { error in
            completion(.connectivity)
        }
    }
}
