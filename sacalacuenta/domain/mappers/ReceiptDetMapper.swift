//
//  ReceiptDetMapper.swift
//  sacalacuenta
//
//  Created by Eddy Mendoza on 4/12/24.
//

struct ReceiptDetMapper: EntityMapper {
    func asDomain(entity: ReceiptDetEntity) -> ItemReceiptView {
        
        return ItemReceiptView(
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
    
    func asEntity(domain: ItemReceiptView) -> ReceiptDetEntity {
        return ReceiptDetEntity(
                id: domain.id,
                idReceipt: domain.idReceipt,
                name: domain.name,
                amount: domain.itemLocked ? nil : domain.amount,
                price: domain.itemLocked ? nil : domain.price,
                total: domain.total
        )
    }
    
    typealias Domain = ItemReceiptView
    
    typealias Entity = ReceiptDetEntity
    
    
    
    
}
