//
//  LoadingProgress.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/27/22.
//

import SwiftUI

struct LoadingProgress: View {
    @Binding var loading: Bool
    
    init(_ isLoading: Binding<Bool>) {
        self._loading = isLoading
    }
    
    var body: some View {
        if loading {
            ProgressView()
                .scaleEffect(3)
        }
    }
}

struct LoadingProgress_Previews: PreviewProvider {
    static var previews: some View {
        LoadingProgress(.constant(false))
    }
}
