//
//  LionStoreApp.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/6/22.
//

import SwiftUI

@main
struct LionStoreApp: App {
    @State private var screen: OnboardingOption?
    
    var body: some Scene {
        WindowGroup {
            switch screen {
            case nil:
                OnboardingScreen(
                    title: "Simply",
                    firstHeaderLine: "Select your photographer,",
                    secondHeaderLine: "then go to session!",
                    illustration: .onboardIllustration,
                    store: OnboardingStore(
                        options: [.signUp, .signIn],
                        handler: { option in
                            print("You selected an option")
                            print(option.rawValue)
                            screen = option
                        })
                )
            case .signUp:
                SignUpScreen()
            case .signIn:
                SignUpScreen()
            }
        }
    }
}
