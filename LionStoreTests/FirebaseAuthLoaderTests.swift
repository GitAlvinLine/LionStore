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

class FirebaseAuthLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestSignInFromFirebaseAuth() {
        let (_, client) = makeSUT()
        
        XCTAssertNil(client.userCredentials?.email)
        XCTAssertNil(client.userCredentials?.password)
    }
    
    func test_signIn_requestsSignInFromFirebaseAuth() {
        let credentials = LoginCredentials(email: "", password: "")
        let (sut, client) = makeSUT(credentials: credentials)
        
        sut.signIn()
        
        XCTAssertNotNil(client.userCredentials?.email)
        XCTAssertNotNil(client.userCredentials?.password)
    }
    
    // MARK: - Helpers
    
    private func makeSUT(credentials: LoginCredentials = LoginCredentials(email: "", password: "")) -> (sut: FirebaseAuthLoader, client: FirebaseAuthClientSpy) {
        let client = FirebaseAuthClientSpy()
        let sut = FirebaseAuthLoader(credentials: credentials, client: client)
        return (sut, client)
    }
    
    private class FirebaseAuthClientSpy: FirebaseAuthClient {
        var userCredentials: LoginCredentials?
        
        func signIn(with credentials: LoginCredentials) {
            userCredentials = credentials
        }
    }
    
}
