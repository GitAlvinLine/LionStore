//
//  ProductCell.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/12/22.
//

import SwiftUI

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

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(.constant(Product(imageURL: "applewatch", category: Category("Watches"), name: "Kinsale Watch", retailPrice: 185, currentPrice: 230)))
    }
}
