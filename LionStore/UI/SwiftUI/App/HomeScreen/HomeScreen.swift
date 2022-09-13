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

struct HomeScreen: View {
    private let categories: [Category] = [
        Category("Watches"),
        Category("Bracelets"),
        Category("Straps"),
        Category("Set")
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
                    .padding(.trailing, 35)
                    
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
