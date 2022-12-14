//
//  PaymentMethodScreen.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/22/22.
//

import SwiftUI

struct PaymentMethodScreen: View {
    @Environment(\.presentationMode) var presentationMode
    let tabSelection: (TabText) -> Void
    let showCardAlert: (Bool) -> Void
    
    @State private var cardholderName: String = ""
    @State private var cardNumber: String = ""
    @State private var cvv: String = ""
    @State private var month: String = ""
    @State private var year: String = ""
    
    @State private var showSuccessOrder: Bool = false
    
    @FocusState private var isInputActive: Bool
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    BackButton(foregroundColor: .lightPurple) {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .opacity(isInputActive ? 0 : 1)
                    
                    Spacer()
                    
                    Menu {
                        Button {
                            print("make default")
                        } label: {
                            Text("Make Default")
                        }
                        
                        Button(role: .destructive) {
                            self.showCardAlert(true)
                        } label: {
                            Text("Remove Card")
                        }


                    } label: {
                        Image("optionsIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding(10)
                    }
                    .foregroundColor(AppColor.lightPurple.value)
                    .opacity(isInputActive ? 0 : 1)
                }
                .padding(.trailing, 20)
                
                VStack(alignment: .leading) {
                    Text("Cardholder name")
                        .padding(.leading, 45)
                    TextField("Cardholder Name", text: $cardholderName)
                        .padding(.leading, 10)
                        .focused($isInputActive)
                        .textFieldBorder(.lightPurple)
                }
                
                VStack(alignment: .leading) {
                    Text("Card Number")
                        .padding(.leading, 45)
                    TextField("0000 0000 0000", text: $cardNumber)
                        .focused($isInputActive)
                        .keyboardType(.numberPad)
                        .padding(.leading, 10)
                        .textFieldBorder(.lightPurple)
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("cvv/cvc")
                            .padding(.leading, 45)
                        TextField("000", text: $cvv)
                            .focused($isInputActive)
                            .keyboardType(.numberPad)
                            .padding(.leading, 50)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(AppColor.lightPurple.value, lineWidth: 2)
                                    .padding(.leading, 45)
                                    .padding(.trailing, 20)
                            )
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Exp. Date")
                            .padding(.trailing, 45)
                        HStack {
                            TextField("00", text: $month)
                                .focused($isInputActive)
                                .keyboardType(.numberPad)
                                .padding(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(AppColor.lightPurple.value, lineWidth: 2)
                                )
                            TextField("00", text: $year)
                                .focused($isInputActive)
                                .keyboardType(.numberPad)
                                .padding(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(AppColor.lightPurple.value, lineWidth: 2)
                                )
                        }
                    }
                    .padding(.trailing, 45)
                }
                
                Spacer()
                CustomButton(text: "Submit Order",
                             textColor: .white,
                             bg: .lightPurple) {
                    showSuccessOrder = true
                }
                             .fullScreenCover(isPresented: $showSuccessOrder) {
                                 SuccessfulPurchaseScreen { tabText in
                                     presentationMode.wrappedValue.dismiss()
                                     tabSelection(tabText)
                                 }
                             }
                             .opacity(isInputActive ? 0 : 1)
            }
            .toolBarDoneButton(_isInputActive)
        }
        .navigationBarHidden(true)
    }
}

struct PaymentMethodScreen_Previews: PreviewProvider {
    static var previews: some View {
        PaymentMethodScreen { _ in } showCardAlert: { _ in }
            .navigationBarHidden(true)
    }
}
