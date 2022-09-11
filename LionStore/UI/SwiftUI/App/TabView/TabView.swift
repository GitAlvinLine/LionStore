//
//  TabView.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/11/22.
//

import SwiftUI

struct TabView: View {
    @Binding var currentTab: TabText
    let tab: Tab
    let tabSelection: (TabText) -> Void
    
    init(currentTab: Binding<TabText>,
         _ tab: Tab,
         _ tabSelection: @escaping (TabText) -> Void) {
        self._currentTab = currentTab
        self.tab = tab
        self.tabSelection = tabSelection
    }
    
    var body: some View {
        Button {
            tabSelection(tab.text)
        } label: {
            VStack {
                tab.image.icon
                    .renderingMode(.template)
                    .resizable()
                    .foregroundColor(currentTab == tab.text ? tab.highlightColor.value : tab.unselectedColor.value)
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                Text(tab.text.rawValue)
                    .foregroundColor(currentTab == tab.text ? tab.highlightColor.value : tab.unselectedColor.value)
                    .font(.system(size: 15, weight: .bold, design: .default))
            }
        }

    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView(currentTab: .constant(.Profile), Tab(image: .profile, text: .Profile)) { _ in
            
        }
    }
}
