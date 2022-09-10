//
//  TextFieldBorder.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/9/22.
//

import SwiftUI

struct TextFieldBorder: ViewModifier {
    let borderColor: AppColor
    
    func body(content: Content) -> some View {
        content
            .padding(.leading, 45)
            .padding(.trailing, 45)
            .frame(width: ScreenSize.width, height: 50)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(borderColor.value, lineWidth: 2)
                    .padding(.leading, 45)
                    .padding(.trailing, 45)
                    .frame(width: ScreenSize.width, height: 50)
            )
    }
}

extension View {
    func textFieldBorder(_ color: AppColor) -> some View {
        modifier(TextFieldBorder(borderColor: color))
    }
}
