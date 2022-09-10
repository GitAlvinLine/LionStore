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
    
    var icon: Image {
        switch self {
        case .email:
            return Image("email_Icon")
        case .mobilePhone:
            return Image("mobile")
        case .appLogo:
            return Image("logo")
        case .passwordLock:
            return Image("password_Icon")
        }
    }
}
