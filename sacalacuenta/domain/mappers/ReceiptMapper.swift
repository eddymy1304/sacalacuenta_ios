//
//  ReceiptMapper.swift
//  sacalacuenta
//
//  Created by Eddy Mendoza on 4/12/24.
//


struct ReceiptMapper : EntityMapper {
    
    
    typealias Domain = ReceiptView
    
    typealias Entity = ReceiptEntity
    
    
    func asDomain(entity: ReceiptEntity) -> ReceiptView {
    
        return ReceiptView(
            id: entity.id,
            date: Utils.formatDateToString(entity.date),
            dateTime: Utils.formatDateToStringWithTime(entity.date),
            numberItems: entity.numberItems,
            title: entity.title,
            total: entity.total,
            paymentMethod: entity.paymentMethod
        )
    }
    
    func asEntity(domain: ReceiptView) -> ReceiptEntity {
        return ReceiptEntity(
            id: domain.id,
            date: Utils.getCurrentDate(),
            numberItems: domain.numberItems,
            title: domain.title,
            total: domain.total,
            paymentMethod: domain.paymentMethod
        )
    }
    
}
