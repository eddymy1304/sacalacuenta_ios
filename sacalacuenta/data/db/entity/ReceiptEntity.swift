//
//  ReceiptEntity.swift
//  sacalacuenta
//
//  Created by Eddy Mendoza on 4/12/24.
//

import Foundation
import SwiftData

@Model
class ReceiptEntity {
    @Attribute(.unique) var id: String = UUID().uuidString
    
    var date: Date
    var numberItems: Int
    var title: String
    var total: Double
    var paymentMethod: String
    
    init(id: String, date: Date, numberItems: Int, title: String, total: Double, paymentMethod: String) {
        self.id = id
        self.date = date
        self.numberItems = numberItems
        self.title = title
        self.total = total
        self.paymentMethod = paymentMethod
    }
}
