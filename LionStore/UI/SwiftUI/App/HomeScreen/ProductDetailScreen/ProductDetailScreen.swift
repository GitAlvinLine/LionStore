//
//  ProductDetailScreen.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/14/22.
//

import SwiftUI

struct ProductDetailScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var product: Product
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    BackButton(foregroundColor: .lightPurple) {
                        presentationMode.wrappedValue.dismiss()
                    }
                    Spacer()
                    Button {
                        $product.isFavorited.wrappedValue.toggle()
                    } label: {
                        Image("favorite")
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .foregroundColor(product.isFavorited ? .red : .gray)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 45, height: 45)
                                    .padding()
                                    .foregroundColor(Color.init(UIColor.lightGray))
                                    .opacity(0.4)
                            )
                            
                    }
                    .buttonStyle(.plain)
                }
                .padding(.trailing, 35)
                
                
                Image(systemName: product.imageURL)
                    .resizable()
                    .scaledToFit()
                    .frame(width: ScreenSize.width * 0.8, height: ScreenSize.height * 0.2)
                    .padding(.top, 20)
                
                HStack {
                    Text(product.name)
                        .font(.title2)
                        .bold()
                    Spacer()
                    Text("$\(product.currentPrice)")
                        .font(.title2)
                        .bold()
                }
                .padding(.top, 40)
                .padding(.leading, 25)
                .padding(.trailing, 25)
                
                Rectangle()
                    .foregroundColor(.gray)
                    .padding(.leading, 25)
                    .padding(.trailing, 25)
                    .frame(width: ScreenSize.width, height: 1)
                
                ScrollView {
                    Text("Inspired by Scandinavian design and engineering, the ontpellier watch is a quality-built accessory for everyday wear. This handmade timepiece has crystal quartz movement, blue crocodile-embossed leather strap and silver water resistant stainless steel case.  Whether you slip it on solo or with a stack of  Grand Frank bangles, the result is timeless.")
                        .font(.subheadline)
                }
                .padding(.top, 20)
                .padding(.leading, 25)
                .padding(.trailing, 25)
                
                CustomButton(text: "Add to Cart",
                             textColor: .white,
                             bg: .lightPurple) {
                    presentationMode.wrappedValue.dismiss()
                }
                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}

struct ProductDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailScreen(product: .constant(.init(imageURL: "applewatch", category: .init("Kinesard watch"), name: "Apple watch", retailPrice: 189, currentPrice: 210)))
    }
}
