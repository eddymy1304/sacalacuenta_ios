//
//  ReceiptRepositoryImpl.swift
//  sacalacuenta
//
//  Created by Eddy Mendoza on 6/12/24.
//

import SwiftData
import Foundation

class ReceiptRepositoryImpl: ReceiptRepository {
    
    private let context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func getListPaymentMethods() -> [PaymentMethod] {
        return getListPaymentMethodsRaw()
    }
    
    func getListReceipt() async throws -> [ReceiptEntity] {
        return try context.fetch(FetchDescriptor<ReceiptEntity>())
    }
    
    func saveReceipt(receipt: ReceiptEntity, listDet: [ReceiptDetEntity]) async throws  {
        
        try await withCheckedThrowingContinuation { continuation in
            Task { @MainActor in
                do {
                    
                    try context.transaction {
                        
                        context.insert(receipt)
                        
                        for det in listDet {
                            det.idReceipt = receipt.id
                            context.insert(det)
                        }
                    }
                    
                    try context.save()
                    continuation.resume()
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
        
    }
    
    func deleteReceipt(id: String) async throws {
        
        let entity = try await getReceiptById(id: id)
        
        if entity != nil {
            context.delete(entity!)
        }
        
        try context.save()
    }
    
    func getReceiptById(id: String) async throws -> ReceiptEntity? {
        
        let fetchDescriptor = FetchDescriptor<ReceiptEntity>(
            predicate: #Predicate{$0.id == id}
        )
        
        return try context.fetch(fetchDescriptor).first
    }
    
    func getListReceiptDetById(id: String) async throws -> [ReceiptDetEntity] {
        let predicate = #Predicate<ReceiptDetEntity> { entity in
            entity.idReceipt == id
        }
        return try context.fetch(FetchDescriptor(predicate: predicate))
    }
}
