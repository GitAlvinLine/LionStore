//
//  RemoveCardAlert.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/22/22.
//

import SwiftUI

struct RemoveCardAlert: View {
    @Binding var showRemoveCardAlert: Bool
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                VStack {
                    Text("Are you sure you want to")
                        .bold()
                    Text("remove this card?")
                        .bold()
                }
                
                HStack {
                    Spacer()
                    Button {
                        self.showRemoveCardAlert.toggle()
                    } label: {
                        Text("Cancel")
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding(.top, 15)
                            .padding(.bottom, 15)
                    }
                    
                    Spacer()
                    
                    Button {
                        self.showRemoveCardAlert.toggle()
                    } label: {
                        Text("Remove")
                            .foregroundColor(.white)
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding(.top, 15)
                            .padding(.bottom, 15)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(AppColor.lightPurple.value)
                            )
                    }
                    
                    Spacer()
                }
                .frame(width: ScreenSize.width * 0.8)
            }
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.white)
                    .frame(width: ScreenSize.width * 0.8, height: ScreenSize.height * 0.2)
            )
        }
        .background(
            Color.black.opacity(0.8)
                .frame(width: ScreenSize.width, height: ScreenSize.height)
                .ignoresSafeArea()
        )
    }
}

struct RemoveCardAlert_Previews: PreviewProvider {
    static var previews: some View {
        RemoveCardAlert(showRemoveCardAlert: .constant(false))
    }
}
