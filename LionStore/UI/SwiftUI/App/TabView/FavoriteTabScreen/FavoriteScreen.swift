//
//  FavoriteScreen.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/20/22.
//

import SwiftUI

struct FavoriteScreen: View {
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Menu {
                        Button {
                            print("sort by price")
                        } label: {
                            Text("Sort by price")
                        }
                        
                        Button {
                            print("sort by date")
                        } label: {
                            Text("Sort by date")
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
                        Image(systemName: "gearshape")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                    }
                    .foregroundColor(AppColor.lightPurple.value)
                    
                }
                .padding(.trailing, 25)
                Spacer()
            }
        }
    }
}

struct FavoriteScreen_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteScreen()
    }
}
