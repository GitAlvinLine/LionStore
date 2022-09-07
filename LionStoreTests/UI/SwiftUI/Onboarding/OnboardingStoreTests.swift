//
//  OnboardingStoreTests.swift
//  LionStoreTests
//
//  Created by Alvin Escobar on 9/6/22.
//

import XCTest
@testable import LionStore

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
