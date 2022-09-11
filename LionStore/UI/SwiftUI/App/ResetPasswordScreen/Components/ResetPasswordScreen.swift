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

struct ResetPasswordTextField: View {
    let placeholder: String
    let placeholderColor: AppColor
    let textFieldColor: AppColor
    @Binding var text: String
    
    var body: some View {
        HStack {
            ZStack {
                HStack {
                    Text(text.isEmpty ? placeholder : "")
                        .foregroundColor(placeholderColor.value)
                        .bold()
                    Spacer()
                }
                TextField("",
                          text: $text)
            }
            .padding(.leading, 15)
        }
        .padding(.leading, 45)
        .padding(.trailing, 45)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(textFieldColor.value, lineWidth: 2)
                .padding(.leading, 45)
                .padding(.trailing, 45)
                .frame(width: ScreenSize.width, height: 50)
        )
    }
}

struct ResetPasswordScreen_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordScreen()
    }
}
