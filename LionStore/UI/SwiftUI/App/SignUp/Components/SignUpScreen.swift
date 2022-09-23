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
    @FocusState private var isInputActive: Bool
    
    let optionCompletion: (OnboardingOption) -> Void
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    AppLogo(image: .appLogo)
                    
                    Spacer()
                    
                    EmailTextField(image: .email,
                                   placeholder: "Email",
                                   email: $email)
                    .focused($isInputActive)
                    
                    PhoneTextField(image: .mobilePhone,
                                   placeholder: "Mobile Number",
                                   phoneNumber: $phoneNumber)
                    .focused($isInputActive)
                    
                    PasswordTextField(image: .passwordLock,
                                      showPassword: $showPassword,
                                      password: $password)
                    .focused($isInputActive)
                    
                    CustomButton(text: "Create an account",
                                 textColor: .white,
                                 bg: .lightPurple) {
                        optionCompletion(.homeScreen)
                    }
                                 .opacity(isInputActive ? 0 : 1)
                    
                    Spacer()

                    AskAccountButton(text: "Already have an account?",
                                     textColor: .lightPurple) {
                        optionCompletion(.signIn)
                    }
                                     .opacity(isInputActive ? 0 : 1)
                }
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        
                        Button {
                            isInputActive = false
                        } label: {
                            Text("Done")
                        }

                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen(optionCompletion: { _ in})
    }
}
