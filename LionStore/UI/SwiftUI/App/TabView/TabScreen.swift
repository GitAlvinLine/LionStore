//
//  TabScreen.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/11/22.
//

import SwiftUI

struct TabScreen: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                TabViewBar()
            }
            .ignoresSafeArea()
        }
    }
}

struct TabScreen_Previews: PreviewProvider {
    static var previews: some View {
        TabScreen()
    }
}
