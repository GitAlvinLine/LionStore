//
//  FavoriteScreen.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/20/22.
//

import SwiftUI

enum SortType {
    case price
    case date
}

struct SortOption: Identifiable {
    var id = UUID()
    var type: SortType
    var text: String
}

struct FavoriteScreen: View {
    
    @State private var sortType: SortType = .price
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    MenuButton(sortType: $sortType)
                    
                }
                .padding(.trailing, 25)
                Spacer()
                
                FavoriteListDetails(4, 266.08)
                Spacer()
            }
            .padding(.top, 60)
        }
    }
}

struct MenuButton: View {
    @Binding var sortType: SortType
    
    private let sortOptions: [SortOption] = [
        SortOption(type: .price,
                   text: "Sort by Price"),
        SortOption(type: .date,
                   text: "Sort by date")
    ]
    
    var body: some View {
        Menu {
            ForEach(sortOptions) { option in
                MenuSortOptionButton(
                    sortOption: option,
                    selectedSortType: $sortType) { sortOption in
                        
                    }
            }
            
            if #available(iOS 15.0, *) {
                Button(role: .destructive) {
                    print("remove all items")
                } label: {
                    Text("Remove all items")
                }
            } else {
                // Fallback on earlier versions
                Button {
                    print("remove all items")
                } label: {
                    Text("Remove all items")
                }
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
}

struct MenuSortOptionButton: View {
    let sortOption: SortOption
    @Binding var selectedSortType: SortType
    let action: (SortType) -> Void
    
    var body: some View {
        Button {
            selectedSortType = sortOption.type
            action(sortOption.type)
        } label: {
            Label(sortOption.text, systemImage: sortOption.type == $selectedSortType.wrappedValue ? "checkmark" : "")
        }
    }
}

struct FavoriteListDetails: View {
    let totalItems: Int
    let totalPrice: Double
    
    init(_ totalItems: Int, _ totalPrice: Double) {
        self.totalItems = totalItems
        self.totalPrice = totalPrice
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Total Items: \(totalItems) items")
                .font(.system(size: 16, weight: .semibold, design: .default))
                .foregroundColor(Color.init(UIColor(red: 143/255, green: 161/255, blue: 180/255, alpha: 1)))
            
            Text("Total Price: $\(String(format: "%.2f", totalPrice))")
                .font(.system(size: 18, weight: .bold, design: .default))
                .foregroundColor(.black)
        }
    }
}

struct FavoriteScreen_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteScreen()
            .ignoresSafeArea()
    }
}
