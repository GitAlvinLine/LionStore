//
//  SettingsScreen.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/27/22.
//

import SwiftUI

struct SettingsScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var vm: SettingsViewModel = SettingsViewModel(FirebaseAuthService())
    let signOut: (OnboardingOption) -> Void
    
    var body: some View {
        ZStack {
            VStack {
                BackButton(foregroundColor: .lightPurple) {
                    presentationMode.wrappedValue.dismiss()
                }
                .padding(.top, 10)
                
                Text("Settings View")
                
                Spacer()
                
                CustomButton(text: "Log Out",
                             textColor: .white,
                             bg: .lightPurple) {
                    vm.logOut()
                    signOut(.signIn)
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen(signOut: { _ in })
    }
}
