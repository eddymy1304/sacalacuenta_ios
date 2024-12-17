//
//  PaymentMethods.swift
//  sacalacuenta
//
//  Created by Eddy Mendoza on 16/12/24.
//

import Foundation

struct PaymentMethod: Identifiable {
    let id: String = UUID().uuidString
    let name: String
}

func getListPaymentMethodsRaw() -> [PaymentMethod] {
    return [
        PaymentMethod(name: "yape"),
        PaymentMethod(name: "plin"),
        PaymentMethod(name: "transferencia"),
        PaymentMethod(name: "tarjeta"),
        PaymentMethod(name: "efectivo")
    ]
}
