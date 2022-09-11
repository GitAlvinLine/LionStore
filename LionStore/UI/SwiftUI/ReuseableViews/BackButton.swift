//
//  BackButton.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/10/22.
//

import SwiftUI

struct BackButton: View {
    let foregroundColor: AppColor
    let action: () -> Void
    
    var body: some View {
        HStack {
            Button {
                action()
            } label: {
                HStack(spacing: 5) {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .foregroundColor(foregroundColor.value)
                    
                    Text("Back")
                        .font(.title2)
                        .bold()
                        .foregroundColor(foregroundColor.value)
                }
            }
            Spacer()
        }
        .padding(.leading, 35)
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton(foregroundColor: .lightPurple, action: {print()})
    }
}
