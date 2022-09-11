//
//  ProfileTabScreen.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/11/22.
//

import SwiftUI

enum ProfileCellImage {
    case notification
    case orders
    case address
    case payment
    case heart
    case settings
    case arrowIndicator
}

enum ProfileCellText: String {
    case Notifications
    case MyOrders = "My Orders"
    case Address
    case Payment
    case Favorites
    case Settings
}

struct ProfileRowCell {
    let image: ProfileCellImage
    let text: ProfileCellText
    let arrowIndicator: ProfileCellImage
    
    init(image: ProfileCellImage, text: ProfileCellText, _ arrowIndictior: ProfileCellImage = .arrowIndicator) {
        self.image = image
        self.text = text
        self.arrowIndicator = arrowIndictior
    }
}

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
