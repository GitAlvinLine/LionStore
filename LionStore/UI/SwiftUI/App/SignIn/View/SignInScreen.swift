//
//  SignInScreen.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/9/22.
//

import SwiftUI

struct SignInScreen: View {
    @StateObject var vm: SignInViewModel = SignInViewModel(FirebaseAuthService())
    @FocusState private var isInputActive: Bool
    
    let optionCompletion: (OnboardingOption) -> Void
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    AppLogo(image: .appLogo)
                    
                    Spacer()
                    
                    VStack(spacing: 20) {
                        EmailTextField(image: .email,
                                       placeholder: "Email",
                                       email: $vm.user.email)
                        .focused($isInputActive)
                        
                        PasswordTextField(image: .passwordLock,
                                          showPassword: $vm.showPassword,
                                          password: $vm.user.password)
                        .focused($isInputActive)
                    }
                    
                    HStack {
                        Spacer()
                        NavigationLink {
                            ResetPasswordScreen()
                        } label: {
                            Text("Forgot Password?")
                                .font(.system(size: 16, weight: .bold, design: .default))
                        }
                    }
                    .padding(.trailing, 45)
                    .padding(.bottom, 40)
                    .opacity(isInputActive ? 0 : 1)
                    
                    CustomButton(text: "Sign In",
                                 textColor: .white,
                                 bg: .lightPurple) {
                        vm.logIn()
                        optionCompletion(.homeScreen)
                    }
                                 .opacity(isInputActive ? 0 : 1)
                    
                    Spacer()
                    
                    AskAccountButton(text: "Create an account?",
                                     textColor: .lightPurple) {
                        optionCompletion(.signUp)
                    }
                                     .opacity(isInputActive ? 0 : 1)

                }
                .toolBarDoneButton(_isInputActive)
            }
            .navigationBarHidden(true)
        }
    }
}

struct SignInScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ZStack {
                SignInScreen { _ in }
                    .navigationBarHidden(true)
            }
        }
    }
}
