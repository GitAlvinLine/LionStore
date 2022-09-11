//
//  SignUpScreen.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/8/22.
//

import SwiftUI

struct SignUpScreen: View {
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    
    let optionCompletion: (OnboardingOption) -> Void
    
    var body: some View {
        VStack {
            AppLogo(image: .appLogo)
            
            Spacer()
            
            EmailTextField(image: .email,
                           placeholder: "Email",
                           email: $email)
            
            PhoneTextField(image: .mobilePhone,
                           placeholder: "Mobile Number",
                           phoneNumber: $phoneNumber)
            
            PasswordTextField(image: .passwordLock,
                              showPassword: $showPassword,
                              password: $password)
            
            CustomButton(text: "Create an account",
                         textColor: .white,
                         bg: .lightPurple) {
                optionCompletion(.homeScreen)
            }
            
            Spacer()

            AskAccountButton(text: "Already have an account?",
                             textColor: .lightPurple) {
                optionCompletion(.signIn)
            }

        }
    }
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen(optionCompletion: { _ in})
    }
}
