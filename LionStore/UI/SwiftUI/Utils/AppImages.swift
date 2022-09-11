//
//  AppImages.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/9/22.
//

import SwiftUI

enum AppImages {
    case email
    case mobilePhone
    case appLogo
    case passwordLock
    case onboardIllustration
    case profile
    case cart
    case home
    case favorite
    
    var icon: Image {
        switch self {
        case .onboardIllustration:
            return Image("Illustration")
        case .email:
            return Image("email_Icon")
        case .mobilePhone:
            return Image("mobile_Icon")
        case .appLogo:
            return Image("logo")
        case .passwordLock:
            return Image("password_Icon")
        case .profile:
            return Image("profile")
        case .cart:
            return Image("cart")
        case .home:
            return Image("home")
        case .favorite:
            return Image("favorite")
        }
    }
}
