//
//  AuthUserMapper.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/26/22.
//

import Foundation

internal final class AuthUserMapper {
    internal static func map(_ uid: String) -> FirebaseAuthLoader.Result {
        return .success(AuthUser(uid: uid))
    }
}
