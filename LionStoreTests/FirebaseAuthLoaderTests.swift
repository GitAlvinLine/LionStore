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
        
        sut.signIn { _ in }
        
        XCTAssertEqual(client.requestedCredentials, [credentials])
    }
    
    func test_signInTwice_requestsSignInFromFirebaseAuthTwice() {
        let credentials = LoginCredentials(email: "", password: "")
        let (sut, client) = makeSUT(credentials: credentials)
        
        sut.signIn { _ in }
        sut.signIn { _ in }
        
        XCTAssertEqual(client.requestedCredentials, [
            LoginCredentials(email: "", password: ""),
            LoginCredentials(email: "", password: "")
        ])
    }
    
    func test_signIn_deliversErrorOnClientError() {
        let (sut, client) = makeSUT()
        
        expect(sut, toCompleteWithError: .connectivity, when: {
            let clientError = NSError(domain: "Test", code: 0)
            client.complete(with: clientError)
        })
    }
    
    func test_signIn_deliversErrorOnFirebaseAuthError() {
        let (sut, client) = makeSUT()
        
        expect(sut, toCompleteWithError: .connectivity, when: {
            let firebaseAuthError = NSError(domain: "Auth Error Code", code: 0)
            client.complete(with: firebaseAuthError)
        })
    }
    
    func test_signIn_deliversErrorOnAuthDataResultWithInvalidAuthUserModel() {
        let (sut, client) = makeSUT()
        
        var capturedResults = [FirebaseAuthLoader.Result]()
        sut.signIn { capturedResults.append($0) }
        
        client.complete(withAuthDataResultUID: "fhkodfkj8his8hf")
        
        XCTAssertEqual(capturedResults, [.failure(.firebaseAuthError)])
    }
    
    // MARK: - Helpers
    
    private func makeSUT(credentials: LoginCredentials = LoginCredentials(email: "", password: "")) -> (sut: FirebaseAuthLoader, client: FirebaseAuthClientSpy) {
        let client = FirebaseAuthClientSpy()
        let sut = FirebaseAuthLoader(credentials: credentials, client: client)
        return (sut, client)
    }
    
    private func expect(_ sut: FirebaseAuthLoader, toCompleteWithError error: FirebaseAuthLoader.Error, when action: () -> Void, file: StaticString = #filePath, line: UInt = #line) {
        
        var capturedResults = [FirebaseAuthLoader.Result]()
        sut.signIn { capturedResults.append($0) }
        
        action()
        
        XCTAssertEqual(capturedResults, [.failure(error)], file: file, line: line)
        
    }
    
    private class FirebaseAuthClientSpy: FirebaseAuthClient {
        
        private var messages = [
            (credentials: LoginCredentials,
             completion: (FirebaseAuthClientResult) -> Void)
        ]()
        
        var requestedCredentials: [LoginCredentials] {
            return messages.map { $0.credentials }
        }
        
        func signIn(with credentials: LoginCredentials, completion: @escaping (FirebaseAuthClientResult) -> Void) {
            messages.append((credentials, completion))
        }
        
        func complete(with error: Error, at index: Int = 0) {
            messages[index].completion(.failure(error))
        }
        
        func complete(withAuthDataResultUID uid: String, at index: Int = 0) {
            messages[index].completion(.success(uid))
        }
    }
    
}
