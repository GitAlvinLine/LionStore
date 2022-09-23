//
//  TabScreen.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/11/22.
//

import SwiftUI

struct TabScreen: View {
    @State private var selection: TabText = .Profile
    @State private var showCardAlert: Bool = false
    
    let signOut: (OnboardingOption) -> Void
    
    var body: some View {
        ZStack {
            VStack {
                switch selection {
                case .Home:
                    HomeScreen()
                case .Cart:
                    CartScreen(tabSelection: $selection,
                               showCardAlert: $showCardAlert)
                case .Favorite:
                    FavoriteScreen()
                case .Profile:
                    ProfileTabScreen { option in
                        signOut(option)
                    }
                }
                Spacer()
                TabViewBar(selection: $selection)
            }
            .ignoresSafeArea()
            .disabled(showCardAlert)
            
            if showCardAlert {
                RemoveCardAlert(showRemoveCardAlert: $showCardAlert)
            }
        }
    }
}

struct TabScreen_Previews: PreviewProvider {
    static var previews: some View {
        TabScreen(signOut: { _ in })
    }
}
