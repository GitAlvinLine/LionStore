//
//  PasswordTextField.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/9/22.
//

import SwiftUI

struct PasswordTextField: View {
    @Binding var showPassword: Bool
    @Binding var password: String
    
    var body: some View {
        HStack {
            Image("password_Icon")
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .padding(.leading, 15)
            ZStack {
                HStack {
                    Text(password.isEmpty ? "Password" : "")
                        .bold()
                        .foregroundColor(Color.init(UIColor(red: 27/255, green: 42/255, blue: 59/255, alpha: 1)))
                        .opacity(0.4)
                    Spacer()
                }
                .padding(.leading, 10)
                HStack {
                    SecureField("", text: $password)
                        .padding(.leading, 10)
                        .disableAutocorrection(true)
                        .opacity(showPassword ? 0 : 1)
                    Spacer()
                    Button {
                        showPassword.toggle()
                    } label: {
                        Image(systemName: showPassword ? "eye" : "eye.slash.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(AppColor.darkBlue.value)
                            .padding(.trailing, 15)
                    }
                }
                
                HStack {
                    TextField("", text: $password)
                        .padding(.leading, 10)
                        .disableAutocorrection(true)
                        .opacity(showPassword ? 1 : 0)
                    Spacer()
                    Button {
                        showPassword.toggle()
                    } label: {
                        Image(systemName: showPassword ? "eye" : "eye.slash.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(AppColor.darkBlue.value)
                            .padding(.trailing, 15)
                    }
                }
            }
        }
        .textFieldBorder(.textFieldBorder)
    }
}

struct PasswordTextField_Previews: PreviewProvider {
    static var previews: some View {
        PasswordTextField(showPassword: .constant(false),
                          password: .constant(""))
    }
}
