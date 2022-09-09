//
//  AppImages.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/9/22.
//

import SwiftUI

enum AppImages {
    case email
    
    var icon: Image {
        switch self {
        case .email:
            return Image("email_Icon")
        }
    }
}
