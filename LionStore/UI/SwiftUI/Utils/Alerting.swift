//
//  Alerting.swift
//  LionStore
//
//  Created by Alvin Escobar on 9/27/22.
//

import Foundation

struct Alerting {
    var showAlert: Bool
    var alertMessage: String
    
    init() {
        self.showAlert = false
        self.alertMessage = ""
    }
    
    mutating func showAlert(_ error: Error) {
        self.alertMessage = error.localizedDescription
        self.showAlert = true
    }
}
