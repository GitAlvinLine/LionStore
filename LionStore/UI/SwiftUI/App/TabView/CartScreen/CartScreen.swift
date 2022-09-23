//
//  CartScreen.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/22/22.
//

import SwiftUI

struct CartScreen: View {
    @Binding var tabSelection: TabText
    @Binding var showCardAlert: Bool
    @State private var selectedSortOption: SortType = .price
    @State private var cartProducts: [FavoriteProduct] = [
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
    @State private var cartIsEmpty: Bool = false
    
    
    private let sortOptions: [SortOption] = [
        SortOption(type: .price,
                   text: "Sort by price"),
        SortOption(type: .date,
                   text: "Sort by date")
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
                        Menu {
                            ForEach(sortOptions) { option in
                                MenuSortOptionButton(sortOption: option,
                                                     selectedSortType: $selectedSortOption) { _ in
                                    
                                }
                            }
                            
                            Button(role: .destructive) {
                                self.cartProducts.removeAll()
                                self.cartIsEmpty = true
                            } label: {
                                Text("Remove all items")
                            }
                            
                        } label: {
                            Image("optionsIcon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .padding(10)
                        }
                        .foregroundColor(AppColor.lightPurple.value)

                    }
                    .padding(.leading, 25)
                    .padding(.trailing, 25)
                    
                    List {
                        ForEach(cartProducts) { product in
                            FavoriteCellRow()
                                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                    RemoveCartButton {
                                        withAnimation {
                                            cartProducts.removeAll{ $0.id == product.id }
                                        }
                                    }
                                }
                        }
                    }
                    .listStyle(.plain)
                    
                    Spacer()
                    FavoriteListDetails(cartProducts.count, totalPrice)
                        .padding(.top, 20)
                        .padding(.bottom, 20)
                    ProceedCheckoutButton { tabText in
                        tabSelection = tabText
                    } showCardAlert: { showAlert in
                        self.showCardAlert = showAlert
                    }
                        .padding(.bottom, 20)
                }
                .fullScreenCover(isPresented: $cartIsEmpty) {
                    EmptyCartScreen { tabText in
                        tabSelection = tabText
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    private var totalPrice: Double {
        let total = cartProducts.reduce(0) { partialResult, product in
            partialResult + product.salePrice
        }
        
        return Double(total)
    }
}

struct ProceedCheckoutButton: View {
    let tabSelection: (TabText) -> Void
    let showCardAlert: (Bool) -> Void
    
    var body: some View {
        NavigationLink {
            PaymentMethodScreen { tabText in
                tabSelection(tabText)
            } showCardAlert: { showAlert in
                showCardAlert(showAlert)
            }
        } label: {
            Text("Proceed to Checkout")
                .foregroundColor(.white)
                .frame(width: ScreenSize.width, height: 50)
                .padding(.leading, -35)
                .padding(.trailing, -35)
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
                CartScreen(tabSelection: .constant(.Home),
                           showCardAlert: .constant(false))
            }
            .navigationBarHidden(true)
        }
    }
}
