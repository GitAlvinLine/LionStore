//
//  ShowPasswordButton.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/9/22.
//

import SwiftUI

struct ShowPasswordButton: View {
    @Binding var showPassword: Bool
    
    var body: some View {
        Button {
            showPassword.toggle()
        } label: {
            Image(systemName: showPassword ? "eye" : "eye.slash.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundColor(AppColor.lightPurple.value)
                .padding(.trailing, 15)
        }
    }
}

struct ShowPasswordButton_Previews: PreviewProvider {
    static var previews: some View {
        ShowPasswordButton(showPassword: .constant(false))
    }
}
