//
//  ProfileTabScreen.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/11/22.
//

import SwiftUI

struct ProfileTabScreen: View {
    let signOut: (OnboardingOption) -> Void
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                CustomButton(text: "Log Out", textColor: .white, bg: .lightPurple) {
                    signOut(.signIn)
                }
                .padding(.bottom, 10)
            }
        }
    }
}

struct ProfileTabScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileTabScreen(signOut: { _ in})
    }
}
