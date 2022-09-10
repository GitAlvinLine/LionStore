//
//  OnboardingOptionButton.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/6/22.
//

import SwiftUI

struct OnboardingOptionButton: View {
    let option: OnboardingOption
    let textColor: AppColor
    let bgColor: AppColor
    let select: (OnboardingOption) -> Void
    
    var body: some View {
        Button {
            select(option)
        } label: {
            Text(option.rawValue)
                .foregroundColor(textColor.value)
                .bold()
                .frame(width: 135, height: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(textColor.value, lineWidth: 2)
                )
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(bgColor.value)
                )
        }
    }
    
}

struct OnboardingOptionButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OnboardingOptionButton(
                option: .signUp,
                textColor: .white,
                bgColor: .lightPurple,
                select: { option in }
            )
            .previewLayout(.sizeThatFits)
            .padding()
            
            OnboardingOptionButton(
                option: .signIn,
                textColor: .lightPurple,
                bgColor: .white,
                select: { option in }
            )
            .previewLayout(.sizeThatFits)
            .padding()
            .preferredColorScheme(.dark)
        }
    }
}
