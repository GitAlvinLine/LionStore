//
//  OnboardingImage.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/6/22.
//

import SwiftUI

struct OnboardingImage: View {
    let image: AppImages
    
    init(_ image: AppImages) {
        self.image = image
    }
    
    var body: some View {
        image.icon
            .resizable()
            .scaledToFit()
            .frame(width: 250, height: 280)
    }
}

struct OnboardingImage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OnboardingImage(
                .onboardIllustration
            )
            .previewLayout(.sizeThatFits)
            .padding()
            
            OnboardingImage(
                .onboardIllustration
            )
            .previewLayout(.sizeThatFits)
            .padding()
            .preferredColorScheme(.dark)
        }
    }
}
