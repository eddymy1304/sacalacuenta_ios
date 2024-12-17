//
//  ReceiptDetMapper.swift
//  sacalacuenta
//
//  Created by Eddy Mendoza on 16/12/24.
//

struct ReceiptDetMapper: EntityMapper {
    
    typealias Domain = ReceiptDetView
    
    typealias Entity = ReceiptDetEntity
    
    func asDomain(entity: ReceiptDetEntity) -> ReceiptDetView {
        
        return ReceiptDetView(
            id: entity.id,
            idReceipt: entity.idReceipt,
            name: entity.name,
            amount: entity.amount ?? 0.00,
            price: entity.price ?? 0.00,
            total: entity.total,
            
            textAmount: Utils.getFormattedDecimal(entity.amount),
            textPrice: Utils.getFormattedDecimal(entity.price),
            textTotal: Utils.getFormattedDecimal(entity.total),
            
            itemLocked: entity.amount == nil && entity.price == nil ? true : false
        )
    }
    
    func asEntity(domain: ReceiptDetView) -> ReceiptDetEntity {
        return ReceiptDetEntity(
                id: domain.id,
                idReceipt: domain.idReceipt,
                name: domain.name,
                amount: domain.itemLocked ? nil : domain.amount,
                price: domain.itemLocked ? nil : domain.price,
                total: domain.total
        )
    }
    
}

extension ReceiptDetEntity {
    
    func asDomain() -> ReceiptDetView {
        return ReceiptDetMapper().asDomain(entity: self)
    }
    
}

extension ReceiptDetView {
    
    func asEntity() -> ReceiptDetEntity {
        return ReceiptDetMapper().asEntity(domain: self)
    }
    
}

extension Array where Element == ReceiptDetView {
    
    func asEntity() -> [ReceiptDetEntity] {
        return self.map { $0.asEntity() }
    }
}

extension Array where Element == ReceiptDetEntity {
    
    func asDomain() -> [ReceiptDetView] {
        return self.map { $0.asDomain() }
    }
    
}
