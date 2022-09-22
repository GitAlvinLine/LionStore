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
    @State private var listsCount: Int = 3
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    MenuButton(sortType: $sortType)
                    
                }
                .padding(.trailing, 25)
                
                List {
                    ForEach(0..<listsCount, id: \.self) { _ in
                        FavoriteCellRow()
                            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                RemoveCartButton {
                                    listsCount -= 1
                                }
                            }
                    }
                }
                .listStyle(.plain)
                Spacer()
                
                FavoriteListDetails(4, 266.08)
                    .padding(.top, 20)
                    .padding(.bottom, 20)
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

struct FavoriteCellRow: View {
    @State private var quantity: Int = 1
    
    var body: some View {
        HStack {
            Image(systemName: "applewatch")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding(.leading, 20)
            VStack(alignment: .leading, spacing: 10) {
                Text("Brown Stone Bracelet")
                    .font(.system(size: 18, weight: .semibold, design: .default))
                
                HStack(spacing: 10) {
                    Text("USD24")
                        .font(.system(size: 14, weight: .semibold, design: .default))
                        .foregroundColor(Color.init(UIColor(red: 143/255, green: 161/255, blue: 180/255, alpha: 1)))
                    Text("USD40")
                        .font(.system(size: 14, weight: .semibold, design: .default))
                        .foregroundColor(.red)
                        .strikethrough(true, color: .red)
                }
                
                HStack(spacing: 10) {
                    Button {
                        quantity += 1
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .padding(10)
                    }
                    
                    Text("\(quantity)")
                        .font(.system(size: 16, weight: .semibold, design: .default))
                    
                    Button {
                        quantity -= 1
                    } label: {
                        Image(systemName: "minus")
                            .font(.system(size: 30, weight: .heavy, design: .default))
                            .foregroundColor(AppColor.lightPurple.value)
                    }
                }
                .padding(.leading, 5)
                .padding(.top, 5)
                .padding(.bottom, 5)
                .padding(.trailing, 5)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .foregroundColor(Color.init(UIColor(red: 234/255, green: 234/255, blue: 234/255, alpha: 1)))
                )
            }
            Spacer()
        }
        .padding(.top, 20)
        .padding(.bottom, 20)
        .buttonStyle(.plain)
    }
}

struct RemoveCartButton: View {
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Label("Remove from Cart", systemImage: "trash")
        }
        .tint(.red)
    }
}

struct FavoriteScreen_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteScreen()
            .ignoresSafeArea()
    }
}
