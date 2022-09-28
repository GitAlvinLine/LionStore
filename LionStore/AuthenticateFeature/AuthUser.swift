//
//  AuthUser.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/24/22.
//

import Foundation

public struct AuthUser: Equatable {
    let uid: String
    
    public init(uid: String) {
        self.uid = uid
    }
}
