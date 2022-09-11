//
//  ResetPasswordScreen.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/9/22.
//

import SwiftUI

struct ResetPasswordScreen: View {
    @State private var text: String = ""
    
    var body: some View {
        ZStack {
            VStack {
                BackButton(foregroundColor: .lightPurple) {
                    print()
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
    }
}

struct ResetPasswordScreen_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordScreen()
    }
}
