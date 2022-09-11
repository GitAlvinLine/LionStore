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

                    VStack(spacing: 20) {
                        ProfilePicture()
                        ProfileName()
                    }

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

struct ProfilePicture: View {
    var body: some View {
        Image(systemName: "person.circle")
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .clipShape(Circle())
    }
}

struct ProfileName: View {
    var body: some View {
        Text("Tanya Robinson")
            .font(.system(size: 20, weight: .bold, design: .default))
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
