//
//  SuccessfulPurchaseScreen.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/22/22.
//

import SwiftUI

struct SuccessfulPurchaseScreen: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        CustomButton(text: "Back to Home",
                     textColor: .white,
                     bg: .lightPurple) {
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct SuccessfulPurchaseScreen_Previews: PreviewProvider {
    static var previews: some View {
        SuccessfulPurchaseScreen()
    }
}
