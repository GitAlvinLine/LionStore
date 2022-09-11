//
//  SignInScreen.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/9/22.
//

import SwiftUI

struct SignInScreen: View {
    @State private var email: String = ""
    @State private var showPassword: Bool = false
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            AppLogo(image: .appLogo)
            
            Spacer()
            
            VStack(spacing: 20) {
                EmailTextField(image: .email,
                               placeholder: "Email",
                               email: $email)
                
                PasswordTextField(image: .passwordLock,
                                  showPassword: $showPassword,
                                  password: $password)
            }
            
            HStack {
                Spacer()
                AskAccountButton(text: "Forgot Password?",
                                 textColor: .lightPurple) {
                    print()
                }
            }
            .padding(.trailing, 45)
            .padding(.bottom, 40)
            
            CustomButton(text: "Sign In",
                         textColor: .white,
                         bg: .lightPurple) {
                print()
            }
            
            Spacer()
            
            AskAccountButton(text: "Create an account?",
                             textColor: .lightPurple) {
                print()
            }

        }
    }
}

struct SignInScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreen()
    }
}
