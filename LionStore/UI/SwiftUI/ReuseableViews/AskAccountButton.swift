//
//  AskAccountButton.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/9/22.
//

import SwiftUI

struct AskAccountButton: View {
    let text: String
    let textColor: AppColor
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .foregroundColor(textColor.value)
                .bold()
        }
    }
}

struct AskAccountButton_Previews: PreviewProvider {
    static var previews: some View {
        AskAccountButton(text: "Already have an account?",
                         textColor: .darkBlue,
                         action: {print()})
    }
}
