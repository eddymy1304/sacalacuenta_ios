//
//  ReceiptView.swift
//  sacalacuenta
//
//  Created by Eddy Mendoza on 30/11/24.
//
import Foundation

struct ReceiptView : Identifiable {
    var id: String = UUID().uuidString
    var date: String = ""
    var dateTime: String = ""
    var numberItems: Int = 0
    var title: String = ""
    var total: Double = 0.00
    var paymentMethod: String = ""
}
