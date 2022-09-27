//
//  FirebaseAuthClientTests.swift
//  LionStoreTests
//
//  Created by Alvin Escobar on 9/26/22.
//

import XCTest
import LionStore
import FirebaseAuth

class SDKFirebaseAuthClient {
    private let auth: Auth
    
    init(auth: Auth) {
        self.auth = auth
    }
    
    func signIn(with credentials: LoginCredentials) {
        auth.signIn(withEmail: credentials.email, password: credentials.password) { _, _ in
            
        }
    }
}

// MARK: - TODO: Make Tests For Using FirebaseSDK Authentication services
class SDKFirebaseAuthClientTests: XCTestCase {
    
    func test() {
        let credentials = LoginCredentials(email: "aeiosdev@gmail.com",
                                           password: "Ronaldo10")
        
        let session = AuthSpy()
        
//        XCTAssertEqual(session.receivedCredentials, [credentials])
    }
    
    class AuthSpy {
        
        var receivedCredentials = [LoginCredentials]()
        
        func signIn(withEmail email: String, password: String) async throws -> FakeAuthDataResult {
            receivedCredentials.append(LoginCredentials(email: email, password: password))
            return FakeAuthDataResult()
        }
    }
    
    class FakeAuthDataResult {
        
    }
}
