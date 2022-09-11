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
                
                CustomButton(text: "Next",
                             textColor: .white,
                             bg: .lightPurple) {
                    print()
                }
                             .padding(.top, 20)

                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}

struct ResetPasswordScreen_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordScreen()
    }
}
