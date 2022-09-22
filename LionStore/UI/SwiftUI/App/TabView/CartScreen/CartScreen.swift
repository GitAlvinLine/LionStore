//
//  CartScreen.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/22/22.
//

import SwiftUI

struct CartScreen: View {
    @State private var selectedSortOption: SortType = .price
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    HStack {
                        Text("Cart")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(AppColor.lightPurple.value)
                        Spacer()
                        MenuButton(sortType: $selectedSortOption)
                    }
                    .padding(.leading, 25)
                    .padding(.trailing, 25)
                    
                    Spacer()
                    ProceedCheckoutButton()
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct ProceedCheckoutButton: View {
    var body: some View {
        NavigationLink {
            PaymentMethodScreen()
        } label: {
            Text("Proceed to Checkout")
                .foregroundColor(.white)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .padding(.leading, 35)
                        .padding(.trailing, 35)
                        .frame(width: ScreenSize.width, height: 50)
                        .foregroundColor(AppColor.lightPurple.value)
                )
        }
    }
}

struct CartScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ZStack {
                CartScreen()
            }
            .navigationBarHidden(true)
        }
    }
}
