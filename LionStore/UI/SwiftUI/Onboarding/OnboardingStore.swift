//
//  OnboardingStore.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/6/22.
//

import Foundation

enum OnboardingOption: String {
    case signUp = "Sign Up"
    case signIn = "Sign In"
}

struct OnboardingStore {
    let options: [OnboardingOption]
    
    let handler: (OnboardingOption) -> Void
    
    internal init(options: [OnboardingOption], handler: @escaping (OnboardingOption) -> Void) {
        self.options = options
        self.handler = handler
    }
    
    func select(_ option: OnboardingOption) {
        self.handler(option)
    }
}
