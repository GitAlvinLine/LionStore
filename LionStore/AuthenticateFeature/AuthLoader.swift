//
//  AuthenticateUser.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/24/22.
//

import Foundation

public enum AuthResult<Error: Swift.Error> {
    case success(AuthUser)
    case failure(Error)
}

extension AuthResult: Equatable where Error: Equatable {}

protocol AuthLoader {
    associatedtype Error: Swift.Error
    func authenticateUser(completion: @escaping (AuthResult<Error>) -> Void)
}
