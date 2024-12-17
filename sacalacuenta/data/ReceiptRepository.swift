//
//  ReceiptRepository.swift
//  sacalacuenta
//
//  Created by Eddy Mendoza on 6/12/24.
//

protocol ReceiptRepository {
    
    func getListReceipt() async throws -> [ReceiptEntity]
    
    func saveReceipt(receipt: ReceiptEntity, listDet: [ReceiptDetEntity]) async throws
    
    func deleteReceipt(id: String) async throws
    
    func getReceiptById(id: String) async throws -> ReceiptEntity?
    
    func getListPaymentMethods() -> [PaymentMethod]
    
    func getListReceiptDetById(id: String) async throws -> [ReceiptDetEntity]
}
