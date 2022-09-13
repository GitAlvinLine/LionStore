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
                                ProductCell($product)
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

struct ProductCell: View {
    @Binding var product: Product
    
    init(_ product: Binding<Product>) {
        self._product = product
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 140, height: 140)
                    .foregroundColor(AppColor.textFieldBorder.value)
                
                Image(systemName: product.imageURL)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                Button {
                    product.isFavorited.toggle()
                } label: {
                    Image("favorite")
                        .renderingMode(.template)
                        .resizable()
                        .foregroundColor(product.isFavorited ? .red : .gray)
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }
                .offset(x: 50, y: -50)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(product.category.name)
                    .font(.system(size: 18, weight: .heavy, design: .default))
                    .minimumScaleFactor(0.5)
                    .lineLimit(nil)
                    .foregroundColor(AppColor.lightPurple.value)
                
                Text(product.name)
                    .font(.system(size: 14, weight: .semibold, design: .default))
                    .minimumScaleFactor(0.5)
                    .lineLimit(nil)
                
                HStack {
                    Text("USD\(product.currentPrice)")
                        .font(.system(size: 14, weight: .heavy, design: .default))
                        .minimumScaleFactor(0.5)
                        .lineLimit(nil)
                        .foregroundColor(.gray)
                    Text("USD\(product.retailPrice)")
                        .font(.system(size: 14, weight: .bold, design: .default))
                        .minimumScaleFactor(0.5)
                        .lineLimit(nil)
                        .foregroundColor(.red)
                }
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
