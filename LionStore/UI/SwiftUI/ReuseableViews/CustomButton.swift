//
//  CustomButton.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/9/22.
//

import SwiftUI

struct CustomButton: View {
    let text: String
    let textColor: Color
    let bg: AppColor
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .foregroundColor(textColor)
                .frame(width: UIScreen.main.bounds.width, height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(bg.value)
                        .padding(.leading, 45)
                        .padding(.trailing, 45)
                )
        }
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(text: "Create an account",
                     textColor: .white,
                     bg: .darkBlue,
                     action: {print()})
    }
}
