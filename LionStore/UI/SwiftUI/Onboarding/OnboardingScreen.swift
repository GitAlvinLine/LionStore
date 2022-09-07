//
//  OnboardingScreen.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/6/22.
//

import SwiftUI

struct OnboardingScreen: View {
    let title: String
    let firstHeaderLine: String
    let secondHeaderLine: String
    let illustration: Image
    let pathOptions: [OnboardingOptions]
    let selected: (OnboardingOptions) -> Void
    
    
    var body: some View {
        VStack(spacing: 80) {
            OnboardingTitle(title,
                            firstHeaderLine,
                            secondHeaderLine)
            OnboardingImage(illustration)
            OnboardingSelectPath(pathOptions, selected)

        }
    }
}

struct OnboardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OnboardingScreen(
                title: "Simply",
                firstHeaderLine: "Select your photographer,",
                secondHeaderLine: "then go to session!",
                illustration: Image("Illustration"),
                pathOptions: [.signUp, .signIn],
                selected: { _ in }
            )
            
            OnboardingScreen(
                title: "Simply",
                firstHeaderLine: "Select your photographer,",
                secondHeaderLine: "then go to session!",
                illustration: Image("Illustration"),
                pathOptions: [.signUp, .signIn],
                selected: { _ in }
            )
            .preferredColorScheme(.dark)
        }
        
    }
}
