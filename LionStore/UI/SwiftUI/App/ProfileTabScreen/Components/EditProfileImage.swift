//
//  EditProfileImage.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/11/22.
//

import SwiftUI

struct EditProfileImage: View {
    var body: some View {
        Image("edit")
            .resizable()
            .scaledToFit()
            .frame(width: 25, height: 25)
            .padding()
            .foregroundColor(AppColor.lightPurple.value)
    }
}

struct EditProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileImage()
    }
}
