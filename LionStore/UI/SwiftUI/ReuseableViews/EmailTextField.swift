//
//  emailTextField.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/9/22.
//

import SwiftUI

struct EmailTextField: View {
    let image: AppImages
    @State var email: String
    let placeholder: String
    
    var body: some View {
        HStack {
            image.icon
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .padding(.leading, 15)
            ZStack {
                TextField("", text: $email)
                    .padding(.leading, 10)
                    .padding(.trailing, 5)
                HStack {
                    Text(email.isEmpty ? placeholder : "")
                        .bold()
                        .foregroundColor(Color.init(UIColor(red: 27/255, green: 42/255, blue: 59/255, alpha: 1)))
                        .opacity(0.4)
                        .padding(.leading, 10)
                    Spacer()
                }
            }
        }
        .padding(.leading, 45)
        .padding(.trailing, 45)
        .frame(width: ScreenSize.width, height: 50)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.init(UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1/10)), lineWidth: 2)
                .padding(.leading, 45)
                .padding(.trailing, 45)
                .frame(width: ScreenSize.width, height: 50)
        )
    }
}

struct emailTextField_Previews: PreviewProvider {
    static var previews: some View {
        EmailTextField(image: .email,
                       email: "",
                       placeholder: "Email")
    }
}
