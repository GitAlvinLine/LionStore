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
                    }
                                 .opacity(isInputActive ? 0 : 1)
                                 .alert(isPresented: $vm.alert.showAlert) {
                                     Alert(title: Text(vm.alert.alertMessage), message: nil, dismissButton: .default(Text("OK")))
                                 }
                    
                    Spacer()
                    
                    AskAccountButton(text: "Create an account?",
                                     textColor: .lightPurple) {
                        optionCompletion(.signUp)
                    }
                                     .opacity(isInputActive ? 0 : 1)

                }
                .toolBarDoneButton(_isInputActive)
                .disabled(vm.isLoading)
                
                LoadingProgress($vm.isLoading)
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
