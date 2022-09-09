//
//  SignUpScreen.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/8/22.
//

import SwiftUI

struct SignUpScreen: View {
    @State private var email: String = ""
    
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Spacer()
            
            EmailTextField(image: Image("email_Icon"),
                           email: email,
                           placeholder: "Email")
            
            CustomButton(text: "Create an account",
                         textColor: .white,
                         bg: .blue) {
                print()
            }

        }
    }
}

enum ScreenSize {
    static let width: CGFloat = UIScreen.main.bounds.width
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen()
    }
}
