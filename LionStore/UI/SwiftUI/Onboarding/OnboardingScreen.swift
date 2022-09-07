//
//  OnboardingScreen.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/6/22.
//

import SwiftUI

enum OnboardingOptions: String {
    case signUp = "Sign Up"
    case signIn = "Sign In"
    
    var bg: Color {
        switch self {
        case .signUp:
            return Color.blue
        case .signIn:
            return Color.white
        }
    }
    
    var textColor: Color {
        switch self {
        case .signUp:
            return Color.white
        case .signIn:
            return Color.blue
        }
    }
}

struct OnboardingScreen: View {
    let title: String
    let firstHeaderLine: String
    let secondHeaderLine: String
    let illustration: Image
    let pathOptions: [OnboardingOptions]
    let selected: (OnboardingOptions) -> Void
    
    
    var body: some View {
        VStack(spacing: 80) {
            OnboardingTitle(title, firstHeaderLine, secondHeaderLine)
            OnboardingImage(illustration)
            OnboardingSelectPath(pathOptions, selected)

        }
    }
}

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

struct OnboardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreen(title: "Simply",
                         firstHeaderLine: "Select your photographer,",
                         secondHeaderLine: "then go to session!",
                         illustration: Image("Illustration"),
                         pathOptions: [.signUp, .signIn],
                         selected: { _ in })
    }
}
