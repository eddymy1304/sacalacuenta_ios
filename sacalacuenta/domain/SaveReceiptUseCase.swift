//
//  SaveReceiptUseCase.swift
//  sacalacuenta
//
//  Created by Eddy Mendoza on 16/12/24.
//

class SaveReceiptUseCase {
    
    private let repository: ReceiptRepository
    
    init(repository: ReceiptRepository) {
        self.repository = repository
    }
    
    func execute(receipt: ReceiptView, listDet: [ReceiptDetView]) async throws {
        let receiptEntity = receipt.asEntity()
        let listDetEntity = listDet.asEntity()
        
        try await repository.saveReceipt(receipt: receiptEntity, listDet: listDetEntity)
    }
}
