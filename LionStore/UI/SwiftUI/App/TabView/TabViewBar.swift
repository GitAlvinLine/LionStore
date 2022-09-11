//
//  TabViewBar.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/11/22.
//

import SwiftUI

enum TabText: String {
    case Home
    case Cart
    case Favorite
    case Profile
}

struct TabViewBar: View {
    var body: some View {
        HStack {
            TabView(image: .passwordLock, text: .Home)
        }
    }
}

struct TabView: View {
    let image: AppImages
    let text:  TabText
    
    var body: some View {
        Button {
            print()
        } label: {
            VStack {
                Image(systemName: "house")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                Text(text.rawValue)
            }
        }

    }
}

struct TabViewBar_Previews: PreviewProvider {
    static var previews: some View {
        TabViewBar()
    }
}
