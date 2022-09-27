//
//  SignUpViewModel.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/27/22.
//

import SwiftUI
import Combine

final class SignUpViewModel: ObservableObject {
    @Published var user: CreateUser = CreateUser()
    @Published var showPassword: Bool = false
}
