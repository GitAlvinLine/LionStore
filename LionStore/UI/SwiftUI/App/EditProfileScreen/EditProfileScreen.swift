//
//  EditProfileScreen.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/11/22.
//

import SwiftUI

struct EditProfileScreen: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            VStack {
                BackButton(foregroundColor: .lightPurple) {
                    presentationMode.wrappedValue.dismiss()
                }
                
                Spacer()
                
                Text("Edit Profile page")
                
                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}

struct EditProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileScreen()
    }
}
