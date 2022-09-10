//
//  AppLogo.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/9/22.
//

import SwiftUI

struct AppLogo: View {
    let image: AppImages
    
    var body: some View {
        image.icon
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
    }
}

struct AppLogo_Previews: PreviewProvider {
    static var previews: some View {
        AppLogo(image: .appLogo)
    }
}
