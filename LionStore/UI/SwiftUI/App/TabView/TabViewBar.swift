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

struct Tab: Identifiable {
    var id = UUID()
    let image: AppImages
    let text: TabText
    let unselectedColor: AppColor
    let highlightColor: AppColor
    
    init(image: AppImages,
         text: TabText,
         _ unselectedColor: AppColor = .textFieldBorder,
         _ highLightColor: AppColor = .lightPurple) {
        self.image = image
        self.text = text
        self.unselectedColor = unselectedColor
        self.highlightColor = highLightColor
    }
}

struct TabViewBar: View {
    @Binding var selection: TabText
    
    private let tabs: [Tab] = [
        Tab(image: .home,
            text: .Home),
        Tab(image: .cart,
            text: .Cart),
        Tab(image: .favorite,
            text: .Favorite),
        Tab(image: .profile,
            text: .Profile),
    ]
    
    var body: some View {
        HStack {
            ForEach(tabs) { tab in
                Spacer()
                TabView(currentTab: $selection, tab) {
                    selection = $0
                }
                Spacer()
            }
        }
        .padding()
        .padding(.bottom, 30)
        .background(
            Rectangle()
                .foregroundColor(.white)
                .shadow(color: AppColor.textFieldBorder.value, radius: 10, x: 0, y: -1)
        )
    }
}

struct TabViewBar_Previews: PreviewProvider {
    static var previews: some View {
        TabViewBar(selection: .constant(.Profile))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
