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
        
        XCTAssertTrue(client.requestedCredentials.isEmpty)
    }
    
    func test_signIn_requestsSignInFromFirebaseAuth() {
        let credentials = LoginCredentials(email: "", password: "")
        let (sut, client) = makeSUT(credentials: credentials)
        
        sut.signIn()
        
        XCTAssertEqual(client.requestedCredentials, [credentials])
    }
    
    func test_signInTwice_requestsSignInFromFirebaseAuthTwice() {
        let credentials = LoginCredentials(email: "", password: "")
        let (sut, client) = makeSUT(credentials: credentials)
        
        sut.signIn()
        sut.signIn()
        
        XCTAssertEqual(client.requestedCredentials, [
            LoginCredentials(email: "", password: ""),
            LoginCredentials(email: "", password: "")
        ])
    }
    
    // MARK: - Helpers
    
    private func makeSUT(credentials: LoginCredentials = LoginCredentials(email: "", password: "")) -> (sut: FirebaseAuthLoader, client: FirebaseAuthClientSpy) {
        let client = FirebaseAuthClientSpy()
        let sut = FirebaseAuthLoader(credentials: credentials, client: client)
        return (sut, client)
    }
    
    private class FirebaseAuthClientSpy: FirebaseAuthClient {
        var requestedCredentials: [LoginCredentials] = []
        
        func signIn(with credentials: LoginCredentials) {
            requestedCredentials.append(credentials)
        }
    }
    
}
