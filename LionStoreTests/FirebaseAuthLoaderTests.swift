//
//  FirebaseAuthLoaderTests.swift
//  LionStoreTests
//
//  Created by Alvin Escobar on 9/24/22.
//

import XCTest

class FirebaseAuthLoader {
    let client: FirebaseAuthClient
    
    init(client: FirebaseAuthClient) {
        self.client = client
    }
    
    func signIn() {
        client.signIn(with: "abc@gmail.com", password: "Xjf(8949;")
    }
}

protocol FirebaseAuthClient {
    func signIn(with email: String, password: String)
}

class FirebaseAuthClientSpy: FirebaseAuthClient {
    var userEmail: String?
    var userPassword: String?
    
    func signIn(with email: String, password: String) {
        userEmail = email
        userPassword = password
    }
}

class FirebaseAuthLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestSignInFromFirebaseAuth() {
        let client = FirebaseAuthClientSpy()
        let _ = FirebaseAuthLoader(client: client)
        
        XCTAssertNil(client.userEmail)
        XCTAssertNil(client.userPassword)
    }
    
    func test_signIn_requestsSignInFromFirebaseAuth() {
        let client = FirebaseAuthClientSpy()
        let sut = FirebaseAuthLoader(client: client)
        
        sut.signIn()
        
        XCTAssertNotNil(client.userEmail)
        XCTAssertNotNil(client.userPassword)
    }
    
}
