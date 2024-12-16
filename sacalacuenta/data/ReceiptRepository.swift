//
//  ReceiptRepository.swift
//  sacalacuenta
//
//  Created by Eddy Mendoza on 6/12/24.
//

protocol ReceiptRepository {
    
    func getListReceipt() async throws -> [ReceiptEntity]
    
    func saveReceipt(receipt: ReceiptEntity, listDet: [ReceiptDetEntity])
    
    func deleteReceipt(id: String)
    
    func getReceiptById(id: String)
    
}
