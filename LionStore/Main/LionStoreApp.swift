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
    
    @StateObject var firebaseAuth = FirebaseAuthService()
    
    var body: some Scene {
        WindowGroup {
            switch firebaseAuth.authState {
            case .loggedOut:
                LoggedOutViews()
            case .loggedIn:
                LoggedInViews()
            }
        }
    }
}

struct LoggedOutViews: View {
    @State private var screen: OnboardingOption?
    
    var body: some View {
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
        }
    }
}

struct LoggedInViews: View {
    var body: some View {
        TabScreen { _ in
            
        }
    }
}
