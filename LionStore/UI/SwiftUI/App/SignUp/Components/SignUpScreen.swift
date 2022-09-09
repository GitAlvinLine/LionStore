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
            
            EmailTextField(image: Image("email_Icon"),
                           email: email,
                           placeholder: "Email")
            
            CustomButton(text: "Create an account",
                         textColor: .white,
                         bg: .blue) {
                print()
            }
            
            Spacer()

            AskAccountButton(text: "Already have an account?")

        }
    }
}

struct AskAccountButton: View {
    let text: String
    
    var body: some View {
        Button {
            print()
        } label: {
            Text(text)
                .foregroundColor(Color.init(UIColor(red: 88/255, green: 107/255, blue: 202/255, alpha: 1)))
                .bold()
        }
    }
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen()
    }
}
