//
//  ResetPasswordTextField.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/10/22.
//

import SwiftUI

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
                TextField("", text: $text)
                    .keyboardType(.emailAddress)
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

struct ResetPasswordTextField_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordTextField(placeholder: "Enter email or phone number", placeholderColor: .lightPurple, textFieldColor: .textFieldBorder, text: .constant(""))
    }
}
