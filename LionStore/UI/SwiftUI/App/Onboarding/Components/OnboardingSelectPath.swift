//
//  OnboardingSelectPath.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/6/22.
//

import SwiftUI

struct OnboardingSelectPath: View {
    let pathOptions: [OnboardingOption]
    let selected: (OnboardingOption) -> Void
    
    init(_ pathOptions: [OnboardingOption], _ selected: @escaping (OnboardingOption) -> Void ) {
        self.pathOptions = pathOptions
        self.selected = selected
    }
    
    var body: some View {
        HStack {
            OnboardingOptionButton(
                option: .signUp,
                textColor: .white,
                bgColor: .lightPurple) { option in
                selected(option)
            }
            
            OnboardingOptionButton(
                option: .signIn,
                textColor: .lightPurple,
                bgColor: .white) { option in
                selected(option)
            }
        }
    }
}

struct OnboardingSelectPath_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingSelectPath(
            [.signUp, .signIn],
            { option in}
        )
        .previewLayout(.sizeThatFits)
        .padding()
        
        OnboardingSelectPath(
            [.signUp, .signIn],
            { option in}
        )
        .previewLayout(.sizeThatFits)
        .padding()
        .preferredColorScheme(.dark)
    }
}
