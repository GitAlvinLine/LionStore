//
//  SuccessfulPurchaseScreen.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/22/22.
//

import SwiftUI

struct SuccessfulPurchaseScreen: View {
    @Environment(\.presentationMode) var presentationMode
    let goToHome: (TabText) -> Void
    
    var body: some View {
        VStack {
            
            Spacer()
            Image("orderDelivery")
                .resizable()
                .scaledToFit()
                .frame(width: ScreenSize.width * 0.7, height: 250)
            
            VStack(spacing: 10) {
                
                Text("Order Success!")
                    .font(.largeTitle)
                    .bold()
                
                VStack(spacing: 5) {
                    Text("Thank you for ordering.")
                        .fontWeight(.medium)
                    Text("Your order is placed and on the")
                        .fontWeight(.medium)
                    Text("way to your address.")
                        .fontWeight(.medium)
                }
                    
            }
            
            Spacer()
            CustomButton(text: "Back to Home",
                         textColor: .white,
                         bg: .lightPurple) {
                presentationMode.wrappedValue.dismiss()
                goToHome(.Home)
            }
                         .padding(.bottom, 20)
        }
    }
}

struct SuccessfulPurchaseScreen_Previews: PreviewProvider {
    static var previews: some View {
        SuccessfulPurchaseScreen { _ in }
    }
}
