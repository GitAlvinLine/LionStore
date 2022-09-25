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
    
    func test_signIn_deliversErrorOnClientError() {
        let (sut, client) = makeSUT()
        
        var capturedErrors = [FirebaseAuthLoader.Error]()
        sut.signIn { capturedErrors.append($0) }
        
        let clientError = NSError(domain: "Test", code: 0)
        client.completions[0](clientError)
        
        XCTAssertEqual(capturedErrors, [.connectivity])
    }
    
    // MARK: - Helpers
    
    private func makeSUT(credentials: LoginCredentials = LoginCredentials(email: "", password: "")) -> (sut: FirebaseAuthLoader, client: FirebaseAuthClientSpy) {
        let client = FirebaseAuthClientSpy()
        let sut = FirebaseAuthLoader(credentials: credentials, client: client)
        return (sut, client)
    }
    
    private class FirebaseAuthClientSpy: FirebaseAuthClient {
        var requestedCredentials: [LoginCredentials] = []
        var error: Error?
        var completions = [(Error) -> Void]()
        
        func signIn(with credentials: LoginCredentials, completion: @escaping (Error) -> Void) {
            completions.append(completion)
            requestedCredentials.append(credentials)
        }
    }
    
}
