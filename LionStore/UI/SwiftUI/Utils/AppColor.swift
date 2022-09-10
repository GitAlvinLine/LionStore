//
//  AppColor.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/9/22.
//

import SwiftUI

enum AppColor{
    case lightPurple
    case textFieldBorder
    
    var value: Color {
        switch self {
        case .lightPurple:
            return Color.init(UIColor(red: 88/255, green: 107/255, blue: 202/255, alpha: 1))
        case .textFieldBorder:
            return Color.init(UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1/10))
        }
    }
}
