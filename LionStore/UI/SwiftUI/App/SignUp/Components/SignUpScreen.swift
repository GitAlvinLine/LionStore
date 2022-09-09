//
//  SignUpScreen.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/8/22.
//

import SwiftUI

struct SignUpScreen: View {
    @State private var email: String = ""
    
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Spacer()
            
            HStack {
                Image("email_Icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .padding(.leading, 15)
                ZStack {
                    TextField("", text: $email)
                        .padding(.leading, 10)
                        .padding(.trailing, 5)
                    HStack {
                        Text(email.isEmpty ? "Email" : "")
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
            
            CustomButton(text: "Create an account",
                         textColor: .white,
                         bg: .blue) {
                print()
            }

        }
    }
}

enum ScreenSize {
    static let width: CGFloat = UIScreen.main.bounds.width
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen()
    }
}
