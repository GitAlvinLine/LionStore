//
//  EmptyCartScreen.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/22/22.
//

import SwiftUI

struct EmptyCartScreen: View {
    @Environment(\.presentationMode) var presentationMode
    let goToHomeScreen: (TabText) -> Void
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Image("emptyBox")
                    .resizable()
                    .scaledToFit()
                    .frame(width: ScreenSize.width, height: 250)
                
                VStack(spacing: 10) {
                    Text("Cart is Empty!")
                        .font(.title)
                        .bold()
                    Text("Let's find something special for you.")
                        .font(.title3)
                        .fontWeight(.medium)
                }
                .padding(.top, 50)
                
                Spacer()
                CustomButton(text: "Start Shopping",
                             textColor: .white,
                             bg: .lightPurple) {
                    presentationMode.wrappedValue.dismiss()
                    goToHomeScreen(.Home)
                }
                             .padding(.bottom, 20)
            }
        }
    }
}

struct EmptyCartScreen_Previews: PreviewProvider {
    static var previews: some View {
        EmptyCartScreen(goToHomeScreen: { _ in })
    }
}
