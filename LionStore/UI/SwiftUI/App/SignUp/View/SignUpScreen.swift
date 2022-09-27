//
//  SignUpScreen.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/8/22.
//

import SwiftUI

struct SignUpScreen: View {
    @StateObject var vm: SignUpViewModel = SignUpViewModel(FirebaseAuthService())
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
                                   email: $vm.user.email)
                    .focused($isInputActive)
                    
                    PhoneTextField(image: .mobilePhone,
                                   placeholder: "Mobile Number",
                                   phoneNumber: $vm.user.phoneNumber)
                    .focused($isInputActive)
                    
                    PasswordTextField(image: .passwordLock,
                                      showPassword: $vm.showPassword,
                                      password: $vm.user.password)
                    .focused($isInputActive)
                    
                    CustomButton(text: "Create an account",
                                 textColor: .white,
                                 bg: .lightPurple) {
                        vm.createUser()
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
                .toolBarDoneButton(_isInputActive)
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
