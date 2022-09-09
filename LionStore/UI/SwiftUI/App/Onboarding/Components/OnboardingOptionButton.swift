//
//  OnboardingOptionButton.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/6/22.
//

import SwiftUI

struct OnboardingOptionButton: View {
    let option: OnboardingOption
    let select: (OnboardingOption) -> Void
    
    var body: some View {
        Button {
            select(option)
        } label: {
            Text(option.rawValue)
                .foregroundColor(textColor)
                .bold()
                .frame(width: 135, height: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(textColor, lineWidth: 2)
                )
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(bg)
                )
        }
    }
    
    private var bg: Color {
        switch option {
        case .signUp:
            return Color.blue
        case .signIn:
            return Color.white
        }
    }
    
    private var textColor: Color {
        switch option {
        case .signUp:
            return Color.white
        case .signIn:
            return Color.blue
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
