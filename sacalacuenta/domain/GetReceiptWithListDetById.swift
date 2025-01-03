//
//  GetReceiptWithListDetById.swift
//  sacalacuenta
//
//  Created by Eddy Mendoza on 18/12/24.
//

class GetReceiptWithListDetById {
    
    private let repository : ReceiptRepository
    
    init(repository: ReceiptRepository) {
        self.repository = repository
    }
    
    func execute(id: String) async throws -> ReceiptWithListDet {
        let receiptEntity = try await repository.getReceiptById(id: id)
        
        let listDetEntities = try await repository.getListReceiptDetById(id: id)
        
        return ReceiptWithListDet(receipt: receiptEntity!.asDomain(), listDet: listDetEntities.asDomain())
    }
    
}
