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
                        Image("optionsIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding(10)
                    }
                    .foregroundColor(AppColor.lightPurple.value)
                    
                }
                .padding(.trailing, 25)
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}

struct FavoriteScreen_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteScreen()
            .ignoresSafeArea()
    }
}
