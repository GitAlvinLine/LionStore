//
//  OnboardingOptionButton.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/6/22.
//

import SwiftUI

struct OnboardingOptionButton: View {
    let option: OnboardingOptions
    let select: (OnboardingOptions) -> Void
    
    var body: some View {
        Button {
            select(option)
        } label: {
            Text(option.rawValue)
                .foregroundColor(option.textColor)
                .bold()
                .frame(width: 135, height: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(option.textColor, lineWidth: 2)
                )
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(option.bg)
                )
        }
    }
}

struct OnboardingOptionButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OnboardingOptionButton(
                option: .signUp,
                select: { option in }
            )
            .previewLayout(.sizeThatFits)
            .padding()
            
            OnboardingOptionButton(
                option: .signIn,
                select: { option in }
            )
            .previewLayout(.sizeThatFits)
            .padding()
            .preferredColorScheme(.dark)
        }
    }
}
