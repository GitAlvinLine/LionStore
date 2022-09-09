//
//  OnboardingImage.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/6/22.
//

import SwiftUI

struct OnboardingImage: View {
    let illustrationImage: Image
    
    init(_ image: Image) {
        self.illustrationImage = image
    }
    
    var body: some View {
            illustrationImage
            .resizable()
            .scaledToFit()
            .frame(width: 250, height: 280)
    }
}

struct OnboardingImage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OnboardingImage(
                Image("Illustration")
            )
            .previewLayout(.sizeThatFits)
            .padding()
            
            OnboardingImage(
                Image("Illustration")
            )
            .previewLayout(.sizeThatFits)
            .padding()
            .preferredColorScheme(.dark)
        }
    }
}
