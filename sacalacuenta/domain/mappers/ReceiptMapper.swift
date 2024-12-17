//
//  ReceiptMapper.swift
//  sacalacuenta
//
//  Created by Eddy Mendoza on 16/12/24.
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

extension ReceiptEntity {
    
    func asDomain() -> ReceiptView {
        return ReceiptMapper().asDomain(entity: self)
    }
    
}

extension ReceiptView {
    
    func asEntity() -> ReceiptEntity {
        return ReceiptMapper().asEntity(domain: self)
    }
    
}

extension Array where Element == ReceiptEntity {
    
    func asDomain() -> [ReceiptView] {
        return self.map{ $0.asDomain() }
    }
    
}

extension Array where Element == ReceiptView {
    
    func asEntity() -> [ReceiptEntity] {
        return self.map{ $0.asEntity() }
    }
}
