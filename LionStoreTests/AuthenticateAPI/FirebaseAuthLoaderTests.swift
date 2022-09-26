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
        
        sut.authenticateUser { _ in }
        
        XCTAssertEqual(client.requestedCredentials, [credentials])
    }
    
    func test_signInTwice_requestsSignInFromFirebaseAuthTwice() {
        let credentials = LoginCredentials(email: "", password: "")
        let (sut, client) = makeSUT(credentials: credentials)
        
        sut.authenticateUser { _ in }
        sut.authenticateUser { _ in }
        
        XCTAssertEqual(client.requestedCredentials, [
            LoginCredentials(email: "", password: ""),
            LoginCredentials(email: "", password: "")
        ])
    }
    
    func test_signIn_deliversErrorOnFirebaseAuthError() {
        let (sut, client) = makeSUT()
        
        expect(sut, toCompleteWith: .failure(FirebaseAuthLoader.Error.firebaseAuthError), when: {
            let firebaseAuthError = NSError(domain: "Auth Error Code", code: 0)
            client.complete(with: firebaseAuthError)
        })
    }
    
    func test_signIn_deliversOnAuthDataResultWithEmptyUID() {
        let (sut, client) = makeSUT()
        
        expect(sut, toCompleteWith: .success(AuthUser(uid: "")), when: {
            client.complete(withAuthDataResultUID: "")
        })
    }
    
    func test_signIn_deliversOnAuthDataResultWithAuthUID() {
        let (sut, client) = makeSUT()
        
        expect(sut, toCompleteWith: .success(AuthUser(uid: "9f8hf8d8basfbx")), when: {
            client.complete(withAuthDataResultUID: "9f8hf8d8basfbx")
        })
    }
    
    func test_signIn_doesNotDeliverResultAfterSUTInstanceHasBeenDeallocated() {
        let credentials = LoginCredentials(email: "abc123Test@gmail.com", password: "HFKionch9hf8h9ef")
        let client = FirebaseAuthClientSpy()
        var sut: FirebaseAuthLoader? = FirebaseAuthLoader(credentials: credentials,
                                                          client: client)
        
        var capturedResults = [FirebaseAuthLoader.Result]()
        sut?.authenticateUser { capturedResults.append($0) }
        
        sut = nil
        client.complete(withAuthDataResultUID: "8fh8jdiuf9")
        
        XCTAssertTrue(capturedResults.isEmpty)
    }
    
    // MARK: - Helpers
    
    private func makeSUT(credentials: LoginCredentials = LoginCredentials(email: "", password: ""), file: StaticString = #filePath, line: UInt = #line) -> (sut: FirebaseAuthLoader, client: FirebaseAuthClientSpy) {
        let client = FirebaseAuthClientSpy()
        let sut = FirebaseAuthLoader(credentials: credentials, client: client)
        trackForMemoryLeaks(sut, file: file, line: line)
        trackForMemoryLeaks(client, file: file, line: line)
        
        return (sut, client)
    }
    
    private func trackForMemoryLeaks(_ instance: AnyObject, file: StaticString = #filePath, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance should have been deallocated. Potential memory leak.", file: file, line: line)
        }
    }
    
    private func expect(_ sut: FirebaseAuthLoader, toCompleteWith expectedResult: FirebaseAuthLoader.Result, when action: () -> Void, file: StaticString = #filePath, line: UInt = #line) {
        
        let exp = expectation(description: "Wait for load completion")
        
        sut.authenticateUser { receivedResult in
            switch (receivedResult, expectedResult) {
            case let (.success(receivedResultItems), .success(expectedResult)):
                XCTAssertEqual(receivedResultItems, expectedResult, file: file, line: line)
            case let (.failure(receivedResult as FirebaseAuthLoader.Error), .failure(expectedResult as FirebaseAuthLoader.Error)):
                XCTAssertEqual(receivedResult, expectedResult, file: file, line: line)
            default:
                XCTFail("Expected result \(expectedResult) got \(receivedResult) instead", file: file, line: line)
            }
            
            exp.fulfill()
        }
        
        action()
        
        wait(for: [exp], timeout: 1.0)
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
