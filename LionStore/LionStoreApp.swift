//
//  LionStoreApp.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/6/22.
//

import SwiftUI

@main
struct LionStoreApp: App {
    var body: some Scene {
        WindowGroup {
            OnboardingScreen(title: "Simply", firstHeaderLine: "Select your photographer,", secondHeaderLine: "then go to session!", illustration: Image("Illustration"), pathOptions: [.signUp, .signIn], selected: { option in })
        }
    }
}
