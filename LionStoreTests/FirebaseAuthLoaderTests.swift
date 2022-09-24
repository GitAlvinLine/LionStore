//
//  FirebaseAuthLoaderTests.swift
//  LionStoreTests
//
//  Created by Alvin Escobar on 9/24/22.
//

import XCTest

struct LoginCredentials {
    var email: String
    var password: String
}

class FirebaseAuthLoader {
    let client: FirebaseAuthClient
    let credentials: LoginCredentials
    
    init(credentials: LoginCredentials, client: FirebaseAuthClient) {
        self.client = client
        self.credentials = credentials
    }
    
    func signIn() {
        client.signIn(with: credentials)
    }
}

protocol FirebaseAuthClient {
    func signIn(with credentials: LoginCredentials)
}

class FirebaseAuthClientSpy: FirebaseAuthClient {
    var userCredentials: LoginCredentials?
    
    func signIn(with credentials: LoginCredentials) {
        userCredentials = credentials
    }
}

class FirebaseAuthLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestSignInFromFirebaseAuth() {
        let client = FirebaseAuthClientSpy()
        let credentials = LoginCredentials(email: "", password: "")
        let _ = FirebaseAuthLoader(credentials: credentials, client: client)
        
        XCTAssertNil(client.userCredentials?.email)
        XCTAssertNil(client.userCredentials?.password)
    }
    
    func test_signIn_requestsSignInFromFirebaseAuth() {
        let client = FirebaseAuthClientSpy()
        let credentials = LoginCredentials(email: "", password: "")
        let sut = FirebaseAuthLoader(credentials: credentials, client: client)
        
        sut.signIn()
        
        XCTAssertNotNil(client.userCredentials?.email)
        XCTAssertNotNil(client.userCredentials?.password)
    }
    
}
