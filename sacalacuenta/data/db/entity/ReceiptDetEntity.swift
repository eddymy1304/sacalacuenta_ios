//
//  ReceiptDetEntity.swift
//  sacalacuenta
//
//  Created by Eddy Mendoza on 4/12/24.
//

import SwiftData
import Foundation

@Model
class ReceiptDetEntity {
    @Attribute(.unique) var id: String = UUID().uuidString
    var idReceipt: String
    var name: String
    var amount: Double?
    var price: Double?
    var total: Double
    
    init(id: String, idReceipt: String, name: String, amount: Double? = nil, price: Double? = nil, total: Double) {
        self.id = id
        self.idReceipt = idReceipt
        self.name = name
        self.amount = amount
        self.price = price
        self.total = total
    }
    
}
