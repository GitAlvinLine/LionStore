//
//  AuthenticateUser.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/24/22.
//

import Foundation

public enum AuthResult {
    case success(AuthUser)
    case failure(Error)
}


protocol AuthLoader {
    func authenticateUser(completion: @escaping (AuthResult) -> Void)
}
