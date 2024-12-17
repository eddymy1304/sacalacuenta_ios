//
//  ReceiptRepositoryImpl.swift
//  sacalacuenta
//
//  Created by Eddy Mendoza on 6/12/24.
//

class ReceiptRepositoryImpl: ReceiptRepository {
    
    func getListPaymentMethods() -> [PaymentMethod] {
        return getListPaymentMethodsRaw()
    }
    
    
    func getListReceipt() async throws -> [ReceiptEntity] {
        return []
    }
    
    
    func getListReceipt() {
    }
    
    func saveReceipt(receipt: ReceiptEntity, listDet: [ReceiptDetEntity]) {
    }
    
    func deleteReceipt(id: String) {
    }
    
    func getReceiptById(id: String) {
    }
    
    
}
