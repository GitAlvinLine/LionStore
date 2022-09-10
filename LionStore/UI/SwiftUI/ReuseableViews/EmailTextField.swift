//
//  emailTextField.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/9/22.
//

import SwiftUI

struct EmailTextField: View {
    let image: AppImages
    let placeholder: String
    @Binding var email: String
    
    var body: some View {
        HStack {
            image.icon
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .padding(.leading, 15)
            ZStack {
                HStack {
                    Text(email.isEmpty ? placeholder : "")
                        .bold()
                        .foregroundColor(Color.init(UIColor(red: 27/255, green: 42/255, blue: 59/255, alpha: 1)))
                        .opacity(0.4)
                        .padding(.leading, 10)
                    Spacer()
                }
                TextField("", text: $email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding(.leading, 10)
                    .padding(.trailing, 5)
            }
        }
        .textFieldBorder(.textFieldBorder)
    }
}

struct emailTextField_Previews: PreviewProvider {
    static var previews: some View {
        EmailTextField(image: .email,
                       placeholder: "Email",
                       email: .constant(""))
    }
}
