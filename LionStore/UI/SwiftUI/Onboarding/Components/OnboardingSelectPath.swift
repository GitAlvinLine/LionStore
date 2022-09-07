//
//  OnboardingSelectPath.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/6/22.
//

import SwiftUI

struct OnboardingSelectPath: View {
    let pathOptions: [OnboardingOptions]
    let selected: (OnboardingOptions) -> Void
    
    init(_ pathOptions: [OnboardingOptions], _ selected: @escaping (OnboardingOptions) -> Void ) {
        self.pathOptions = pathOptions
        self.selected = selected
    }
    
    var body: some View {
        HStack {
            ForEach(pathOptions, id: \.self) { option in
                OnboardingOptionButton(option: option) { option in
                    selected(option)
                }
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
