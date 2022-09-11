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
        NavigationView {
            ZStack {
                VStack {
                    HStack {
                        Spacer()
                        NavigationLink {
                            EmptyView()
                        } label: {
                            EditProfileImage()
                        }
                    }
                    .padding(.trailing, 30)


                    Spacer()
                    CustomButton(text: "Log Out", textColor: .white, bg: .lightPurple) {
                        signOut(.signIn)
                    }
                    .padding(.bottom, 10)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct ProfileTabScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ZStack {
                ProfileTabScreen(signOut: { _ in})
            }
            .navigationBarHidden(true)
        }
    }
}
