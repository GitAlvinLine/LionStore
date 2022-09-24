//
//  LionStoreApp.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/6/22.
//

import SwiftUI

@main
struct LionStoreApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
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
                            screen = option
                        })
                )
            case .signUp:
                SignUpScreen { option in
                    screen = option
                }
            case .signIn:
                SignInScreen { option in
                    screen = option
                }
            case .homeScreen:
                TabScreen { option in
                    screen = option
                }
            }
        }
    }
}
