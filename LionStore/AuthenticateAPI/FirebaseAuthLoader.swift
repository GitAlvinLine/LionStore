//
//  FirebaseAuthLoader.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/24/22.
//

import Foundation

public protocol FirebaseAuthClient {
    func signIn(with credentials: LoginCredentials)
}

final public class FirebaseAuthLoader {
    private let credentials: LoginCredentials
    private let client: FirebaseAuthClient
    
    public init(credentials: LoginCredentials, client: FirebaseAuthClient) {
        self.client = client
        self.credentials = credentials
    }
    
    public func signIn() {
        client.signIn(with: credentials)
    }
}
