//
//  ToolBarDoneButton.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/23/22.
//

import SwiftUI

struct ToolBarDoneButton: ViewModifier {
    @FocusState var isInputActive: Bool
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button {
                        isInputActive = false
                    } label: {
                        Text("Done")
                    }
                }
            }
    }
}

extension View {
    func toolBarDoneButton(_ isInputActive: FocusState<Bool>) -> some View {
        modifier(ToolBarDoneButton(isInputActive: isInputActive))
    }
}
