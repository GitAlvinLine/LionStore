//
//  OnboardingTitle.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/6/22.
//

import SwiftUI

struct OnboardingTitle: View {
    let title: String
    let firstHeaderLine: String
    let secondHeaderLine: String
    
    init(_ title: String, _ firstHeaderLine: String, _ secondHeaderLine: String) {
        self.title = title
        self.firstHeaderLine = firstHeaderLine
        self.secondHeaderLine = secondHeaderLine
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
                .font(.title)
                .bold()
            VStack(spacing: 5) {
                Text(firstHeaderLine)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(UIColor.darkGray))
                Text(secondHeaderLine)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(UIColor.darkGray))
            }
        }
    }
}

struct OnboardingTitle_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OnboardingTitle("Simply",
                            "Select your photographer,",
                            "then go to session!")
            .previewLayout(.sizeThatFits)
            .padding()
            
            OnboardingTitle("Simply",
                            "Select your photographer,",
                            "then go to session!")
            .previewLayout(.sizeThatFits)
            .padding()
            .preferredColorScheme(.dark)
        }
    }
}
