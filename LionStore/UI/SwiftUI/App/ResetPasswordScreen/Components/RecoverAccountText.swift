//
//  RecoverAccountText.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/10/22.
//

import SwiftUI

struct RecoverAccountText: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Recover")
                Text("your account")
            }
            .font(.system(size: 25, weight: .bold, design: .default))
            Spacer()
        }
        .padding(.leading, 45)
        .padding(.top, 45)
    }
}

struct RecoverAccountText_Previews: PreviewProvider {
    static var previews: some View {
        RecoverAccountText()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
