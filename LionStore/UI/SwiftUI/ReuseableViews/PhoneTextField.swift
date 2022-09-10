//
//  PhoneTextField.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/9/22.
//

import SwiftUI

struct PhoneTextField: View {
    let image: AppImages
    let placeholder: String
    @Binding var phoneNumber: String
    
    var body: some View {
        HStack {
            image.icon
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .padding(.leading, 15)
            ZStack {
                HStack {
                    Text(phoneNumber.isEmpty ? placeholder : "")
                        .bold()
                        .foregroundColor(Color.init(UIColor(red: 27/255, green: 42/255, blue: 59/255, alpha: 1)))
                        .opacity(0.4)
                    Spacer()
                }
                .padding(.leading, 10)
                TextField("", text: $phoneNumber)
                    .padding(.leading, 10)
                    .keyboardType(.numberPad)
                    .disableAutocorrection(true)
            }
        }
        .textFieldBorder(.textFieldBorder)
    }
}

struct PhoneTextField_Previews: PreviewProvider {
    static var previews: some View {
        PhoneTextField(image: .mobilePhone,
                       placeholder: "Mobile Number",
                       phoneNumber: .constant(""))
    }
}
