//
//  FirebaseAuthLoaderTests.swift
//  LionStoreTests
//
//  Created by Alvin Escobar on 9/24/22.
//

import XCTest
import LionStore

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
