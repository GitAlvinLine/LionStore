//
//  FirebaseAuthClient.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/26/22.
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
