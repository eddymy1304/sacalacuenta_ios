//
//  ItemReceiptView.swift
//  sacalacuenta
//
//  Created by Eddy Mendoza on 2/12/24.
//

import SwiftUI

struct ItemReceiptView : Identifiable, Equatable, Hashable {
    
    var id: String = UUID().uuidString
    var idReceipt: String = ""
    var name: String = ""
    var amount: Double = 0.00
    var price: Double = 0.00
    var total: Double = 0.00
    
    var textAmount: String = ""
    var textPrice: String = ""
    var textTotal: String = "0.00"
    
    var itemLocked: Bool = true
}
