//
//  CartScreen.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/22/22.
//

import SwiftUI

struct CartScreen: View {
    @State private var selectedSortOption: SortType = .price
    @State private var favoriteProducts: [FavoriteProduct] = [
        FavoriteProduct(name: "Brown Stone Bracelet",
                        retailPrice: 40,
                        salePrice: 24,
                        quantity: 1,
                        imageName: "applewatch"),
        FavoriteProduct(name: "Brown Stone Bracelet",
                        retailPrice: 40,
                        salePrice: 24,
                        quantity: 1,
                        imageName: "applewatch"),
        FavoriteProduct(name: "Brown Stone Bracelet",
                        retailPrice: 40,
                        salePrice: 24,
                        quantity: 1,
                        imageName: "applewatch"),
        FavoriteProduct(name: "Brown Stone Bracelet",
                        retailPrice: 40,
                        salePrice: 24,
                        quantity: 1,
                        imageName: "applewatch"),
        FavoriteProduct(name: "Brown Stone Bracelet",
                        retailPrice: 40,
                        salePrice: 24,
                        quantity: 1,
                        imageName: "applewatch"),
        FavoriteProduct(name: "Brown Stone Bracelet",
                        retailPrice: 40,
                        salePrice: 24,
                        quantity: 1,
                        imageName: "applewatch"),
        FavoriteProduct(name: "Brown Stone Bracelet",
                        retailPrice: 40,
                        salePrice: 24,
                        quantity: 1,
                        imageName: "applewatch")
    ]
    
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
                    
                    List {
                        ForEach(favoriteProducts) { product in
                            FavoriteCellRow()
                                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                    RemoveCartButton {
                                        withAnimation {
                                            favoriteProducts.removeAll{ $0.id == product.id }
                                        }
                                    }
                                }
                        }
                    }
                    .listStyle(.plain)
                    
                    Spacer()
                    FavoriteListDetails(favoriteProducts.count, totalPrice)
                        .padding(.top, 20)
                        .padding(.bottom, 20)
                    ProceedCheckoutButton()
                        .padding(.bottom, 20)
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    private var totalPrice: Double {
        let total = favoriteProducts.reduce(0) { partialResult, product in
            partialResult + product.salePrice
        }
        
        return Double(total)
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
