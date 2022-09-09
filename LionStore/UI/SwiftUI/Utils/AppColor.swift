//
//  AppColor.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/9/22.
//

import SwiftUI

enum AppColor{
    case darkBlue
    
    var value: Color {
        switch self {
        case .darkBlue:
            return Color.init(UIColor(red: 88/255, green: 107/255, blue: 202/255, alpha: 1))
        }
    }
}
