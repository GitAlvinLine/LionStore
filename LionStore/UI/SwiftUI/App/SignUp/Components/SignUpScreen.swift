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
            AppLogo(image: .appLogo)
            
            Spacer()
            
            EmailTextField(image: .email,
                           email: email,
                           placeholder: "Email")
            
            CustomButton(text: "Create an account",
                         textColor: .white,
                         bg: .darkBlue) {
                print()
            }
            
            Spacer()

            AskAccountButton(text: "Already have an account?",
                             textColor: .darkBlue) {
                print()
            }

        }
    }
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen()
    }
}
