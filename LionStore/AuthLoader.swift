//
//  AuthenticateUser.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/24/22.
//

import Foundation

enum AuthResult {
    case success
    case error(Error)
}

protocol AuthLoader {
    func authenticateUser(completion: @escaping (AuthResult) -> Void)
}
