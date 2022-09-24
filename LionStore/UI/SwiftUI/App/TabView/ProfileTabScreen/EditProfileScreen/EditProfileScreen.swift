//
//  EditProfileScreen.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/11/22.
//

import SwiftUI

struct EditProfileScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name: String = ""
    @State private var address: String = ""
    @State private var city: String = ""
    @State private var zipCode: String = ""
    @State private var phoneNumber: String = ""
    @State private var checkedBox: Bool = false
    @FocusState private var isInputActive: Bool
    
    var body: some View {
        ZStack {
            VStack {
                BackButton(foregroundColor: .lightPurple) {
                    presentationMode.wrappedValue.dismiss()
                }
                .opacity(isInputActive ? 0 : 1)
                
                VStack(spacing: 40) {
                    VStack(spacing: 20) {
                        HStack {
                            Text("Name")
                                .font(.system(size: 14, weight: .medium, design: .default))
                            Spacer()
                        }
                        .padding(.leading, 35)
                        
                        TextField("Tanya Robinson", text: $name)
                            .font(.title3)
                            .focused($isInputActive)
                            .padding(.leading, 45)
                            .padding(.trailing, 35)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(AppColor.textFieldBorder.value, lineWidth: 2)
                                    .frame(height: 40)
                                    .padding(.leading, 35)
                                    .padding(.trailing, 35)
                            )
                    }
                    
                    VStack(spacing: 20) {
                        HStack {
                            Text("Address")
                                .font(.system(size: 14, weight: .medium, design: .default))
                            Spacer()
                        }
                        .padding(.leading, 35)
                        
                        TextField("123 Main St", text: $address)
                            .font(.title3)
                            .focused($isInputActive)
                            .padding(.leading, 45)
                            .padding(.trailing, 35)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(AppColor.textFieldBorder.value, lineWidth: 2)
                                    .frame(height: 40)
                                    .padding(.leading, 35)
                                    .padding(.trailing, 35)
                            )
                    }
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 20) {
                            Text("City")
                                .font(.system(size: 14, weight: .medium, design: .default))
                            TextField("Big Rock", text: $address)
                                .padding(.leading, 10)
                                .focused($isInputActive)
                                .font(.title3)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(AppColor.textFieldBorder.value, lineWidth: 2)
                                        .frame(height: 40)
                                )
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 20) {
                            Text("ZIP Code")
                                .font(.system(size: 14, weight: .medium, design: .default))
                            TextField("738749", text: $address)
                                .keyboardType(.numberPad)
                                .focused($isInputActive)
                                .padding(.leading, 10)
                                .font(.title3)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(AppColor.textFieldBorder.value, lineWidth: 2)
                                        .frame(height: 40)
                                )
                        }
                    }
                    .padding(.leading, 35)
                    .padding(.trailing, 35)
                    
                    VStack(spacing: 20) {
                        HStack {
                            Text("Mobile Number")
                                .font(.system(size: 14, weight: .medium, design: .default))
                            Spacer()
                        }
                        .padding(.leading, 35)
                        
                        TextField("+962 790 688 4798", text: $address)
                            .keyboardType(.numberPad)
                            .focused($isInputActive)
                            .font(.title3)
                            .padding(.leading, 45)
                            .padding(.trailing, 35)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(AppColor.textFieldBorder.value, lineWidth: 2)
                                    .frame(height: 40)
                                    .padding(.leading, 35)
                                    .padding(.trailing, 35)
                            )
                    }
                    
                    HStack {
                        Button {
                            checkedBox.toggle()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 4.5)
                                    .stroke(AppColor.textFieldBorder.value, lineWidth: 2)
                                    .frame(width: 30, height: 30)
                                Image(systemName: "checkmark")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.green)
                                    .opacity(checkedBox ? 1 : 0)
                            }
                        }
                        
                        Text("Set as default address")
                            .font(.system(size: 16, weight: .medium, design: .default))
                            .padding(.leading, 10)
                        Spacer()
                    }
                    .padding(.leading, 35)
                    .opacity(isInputActive ? 0 : 1)
                }
                .padding(.top, 40)
                
                Spacer()
                
                CustomButton(text: "Save Changes",
                             textColor: .white,
                             bg: .lightPurple) {
                    presentationMode.wrappedValue.dismiss()
                }
                             .opacity(isInputActive ? 0 : 1)
            }
            .toolBarDoneButton(_isInputActive)
        }
        .navigationBarHidden(true)
    }
}

struct EditProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileScreen()
    }
}
