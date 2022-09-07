//
//  OnboardingStoreTests.swift
//  LionStoreTests
//
//  Created by Alvin Escobar on 9/6/22.
//

import XCTest

enum OnboardingOption: String {
    case signUp
    case signIn
}

struct OnboardingStore {
    let options: [OnboardingOption]
    
    private let handler: (OnboardingOption) -> Void
    
    internal init(options: [OnboardingOption], handler: @escaping (OnboardingOption) -> Void) {
        self.options = options
        self.handler = handler
    }
    
    func select(_ option: OnboardingOption) {
        self.handler(option)
    }
}

class OnboardingStoreTests: XCTestCase {
    
    func test_select_notifiesHandlerWithSelectedOption() {
        var selectedOption: [OnboardingOption] = []
        let sut = OnboardingStore(options: [.signUp, .signIn], handler: { option in
            selectedOption.append(option)
        })
        
        XCTAssertEqual(sut.options.count, 2)
        sut.select(sut.options.randomElement()!)
        XCTAssertEqual(selectedOption.count, 1)
    }

}
