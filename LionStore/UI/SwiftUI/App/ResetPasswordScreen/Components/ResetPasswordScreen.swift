//
//  ResetPasswordScreen.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/9/22.
//

import SwiftUI

struct ResetPasswordScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var text: String = ""
    @FocusState private var isInputActive: Bool
    
    var body: some View {
        ZStack {
            VStack {
                BackButton(foregroundColor: .lightPurple) {
                    presentationMode.wrappedValue.dismiss()
                }
                
                RecoverAccountText()
                
                Spacer()
                
                ResetPasswordTextField(
                    placeholder: "Enter email or phone number",
                    placeholderColor: .textFieldBorder,
                    textFieldColor: .textFieldBorder,
                    text: $text)
                .focused($isInputActive)
                
                CustomButton(text: "Next",
                             textColor: .white,
                             bg: .lightPurple) {
                    print()
                }
                             .padding(.top, 20)
                             .opacity(isInputActive ? 0 : 1)

                Spacer()
            }
            .toolBarDoneButton(_isInputActive)
        }
        .navigationBarHidden(true)
    }
}

struct ResetPasswordScreen_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordScreen()
    }
}
