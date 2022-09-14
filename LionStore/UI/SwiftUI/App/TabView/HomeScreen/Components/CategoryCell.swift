//
//  CategoryCell.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/12/22.
//

import SwiftUI

struct CategoryCell: View {
    let category: Category
    let textColor: AppColor
    let borderColor: AppColor
    
    var body: some View {
        Text(category.name)
            .font(.system(size: 16, weight: .heavy, design: .default))
            .minimumScaleFactor(0.5)
            .lineLimit(nil)
            .padding()
            .foregroundColor(textColor.value)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(borderColor.value, lineWidth: 2)
            )
    }
}

struct CategoryCell_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCell(category: Category("Watches"),
                     textColor: .lightPurple,
                     borderColor: .lightPurple)
    }
}
