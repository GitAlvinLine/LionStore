//
//  LoginCredentials.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/24/22.
//

import Foundation

public struct LoginCredentials {
    public var email: String
    public var password: String
    
    public init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
