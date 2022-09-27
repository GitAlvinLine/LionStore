//
//  SignUpViewModel.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/27/22.
//

import Combine

final class SignUpViewModel: ObservableObject {
    @Published var user: CreateUser = CreateUser()
}
