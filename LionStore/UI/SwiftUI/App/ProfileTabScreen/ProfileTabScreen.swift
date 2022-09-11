//
//  ProfileTabScreen.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/11/22.
//

import SwiftUI

enum ProfileCellImage: String {
    case notification
    case orders
    case address
    case payment
    case heart
    case settings
    case arrowIndicator = "chevron.right"
}

enum ProfileCellText: String {
    case Notifications
    case MyOrders = "My Orders"
    case Address
    case Payment
    case Favorites
    case Settings
}

struct ProfileCellModel: Identifiable {
    var id = UUID()
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
    
    private let cells: [ProfileCellModel] = [
        ProfileCellModel(image: .notification, text: .Notifications),
        ProfileCellModel(image: .orders, text: .MyOrders),
        ProfileCellModel(image: .address, text: .Address),
        ProfileCellModel(image: .payment, text: .Payment),
        ProfileCellModel(image: .heart, text: .Favorites),
        ProfileCellModel(image: .settings, text: .Settings)
    ]
    
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
                    
                    VStack {
                        ForEach(cells) { cell in
                            NavigationLink {
                                EmptyView()
                            } label: {
                                ProfileCellView(model: cell)
                            }
                        }
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

struct ProfileCellView: View {
    let model: ProfileCellModel
    
    var body: some View {
        HStack(alignment: .center) {
            Image(model.image.rawValue)
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
            Text(model.text.rawValue)
                .foregroundColor(.black)
                .font(.system(size: 15, weight: .semibold, design: .default))
                .padding(.leading, 20)
            Spacer()
            Image(systemName: model.arrowIndicator.rawValue)
                .font(Font.subheadline.weight(.bold))
                .foregroundColor(AppColor.lightPurple.value)
        }
        .padding()
        .padding(.leading, 40)
        .padding(.trailing, 40)
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
