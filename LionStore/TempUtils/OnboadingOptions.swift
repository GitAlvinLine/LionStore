//
//  OnboadingOptions.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/6/22.
//

import SwiftUI
import Foundation

enum OnboardingOptions: String {
    case signUp = "Sign Up"
    case signIn = "Sign In"
    
    var bg: Color {
        switch self {
        case .signUp:
            return Color.blue
        case .signIn:
            return Color.white
        }
    }
    
    var textColor: Color {
        switch self {
        case .signUp:
            return Color.white
        case .signIn:
            return Color.blue
        }
    }
}
