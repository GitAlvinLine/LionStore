//
//  HomeScreen.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/12/22.
//

import SwiftUI

struct Category: Identifiable {
    var id = UUID()
    let name: String
    
    init(_ name: String) {
        self.name = name
    }
}

struct Product: Identifiable {
    var id = UUID()
    let imageURL: String
    let category: Category
    let name: String
    let retailPrice: Int
    let currentPrice: Int
    var isFavorited: Bool
    
    init(imageURL: String,
         category: Category,
         name: String,
         retailPrice: Int,
         currentPrice: Int,
         isFavorited: Bool = false) {
        
        self.imageURL = imageURL
        self.category = category
        self.name = name
        self.retailPrice = retailPrice
        self.currentPrice = currentPrice
        self.isFavorited = isFavorited
    }
}

struct HomeScreen: View {
    private let categories: [Category] = [
        Category("Watches"),
        Category("Bracelets"),
        Category("Straps"),
        Category("Set")
    ]
    
    @State private var mostSellingProducts: [Product] = [
        Product(imageURL: "applewatch",
                category: Category("Watches"),
                name: "Kinsale Watch",
                retailPrice: 230,
                currentPrice: 185),
        Product(imageURL: "applewatch",
                category: Category("Watches"),
                name: "Kinsale Watch",
                retailPrice: 230,
                currentPrice: 185),
        Product(imageURL: "applewatch",
                category: Category("Watches"),
                name: "Kinsale Watch",
                retailPrice: 230,
                currentPrice: 185)
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    HStack {
                        Text("Select from categories")
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .minimumScaleFactor(0.5)
                            .lineLimit(nil)
                        Spacer()
                        Button {
                            print()
                        } label: {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(AppColor.lightPurple.value)
                        }
                    }
                    .padding(.leading, 35)
                    .padding(.trailing, 35)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(categories) { category in
                                CategoryCell(category: category,
                                             textColor: .lightPurple,
                                             borderColor: .lightPurple)
                            }
                        }
                        .padding(.leading, 5)
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                    }
                    .padding(.leading, 30)
                    
                    HStack {
                        Text("Most Selling")
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .minimumScaleFactor(0.5)
                            .lineLimit(nil)
                        Spacer()
                        Button {
                            print()
                        } label: {
                            Text("View All")
                                .font(.system(size: 16, weight: .bold, design: .default))
                                .minimumScaleFactor(0.5)
                                .lineLimit(nil)
                        }

                    }
                    .padding(.leading, 35)
                    .padding(.trailing, 35)
                    .padding(.top, 30)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach($mostSellingProducts) { $product in
                                NavigationLink {
                                    EmptyView()
                                } label: {
                                    ProductCell($product)
                                }
                            }
                        }
                    }
                    .padding(.leading, 35)
                    
                    HStack {
                        Text("Recently Added")
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .minimumScaleFactor(0.5)
                            .lineLimit(nil)
                        Spacer()
                        Button {
                            print()
                        } label: {
                            Text("View All")
                                .font(.system(size: 16, weight: .bold, design: .default))
                                .minimumScaleFactor(0.5)
                                .lineLimit(nil)
                        }

                    }
                    .padding(.leading, 35)
                    .padding(.trailing, 35)
                    .padding(.top, 30)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach($mostSellingProducts) { $product in
                                NavigationLink {
                                    EmptyView()
                                } label: {
                                    ProductCell($product)
                                }
                            }
                        }
                    }
                    .padding(.leading, 35)
                    
                    Spacer()
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
