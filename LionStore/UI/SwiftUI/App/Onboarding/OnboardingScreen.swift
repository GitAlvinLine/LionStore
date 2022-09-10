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
    let illustration: AppImages
    let store: OnboardingStore
    
    
    var body: some View {
        VStack(spacing: 80) {
            OnboardingTitle(title,
                            firstHeaderLine,
                            secondHeaderLine)
            OnboardingImage(illustration)
            OnboardingSelectPath(store.options, store.handler)

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
                illustration: .onboardIllustration,
                store: .init(
                    options: [.signUp, .signIn],
                    handler: { _ in })
            )
            
            OnboardingScreen(
                title: "Simply",
                firstHeaderLine: "Select your photographer,",
                secondHeaderLine: "then go to session!",
                illustration: .onboardIllustration,
                store: .init(
                    options: [.signUp, .signIn],
                    handler: { _ in })
            )
            .preferredColorScheme(.dark)
        }
        
    }
}
