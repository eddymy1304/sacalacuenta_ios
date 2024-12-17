//
//  PaymentMethodMapper.swift
//  sacalacuenta
//
//  Created by Eddy Mendoza on 16/12/24.
//

struct PaymentMethodMapper: EntityMapper {
    
    func asDomain(entity: PaymentMethod) -> PaymentMethodView {
        return PaymentMethodView(id: entity.id, name: entity.name)
    }
    
    
    func asEntity(domain: PaymentMethodView) -> PaymentMethod {
        return PaymentMethod(name: domain.name)
    }
    
    typealias Domain = PaymentMethodView
    
    typealias Entity = PaymentMethod
    
}

extension PaymentMethod {
    
    func asDomain() -> PaymentMethodView {
        return PaymentMethodMapper().asDomain(entity: self)
    }
    
}

extension Array where Element == PaymentMethod {
    
    func asDomain() -> [PaymentMethodView] {
        return self.map { $0.asDomain() }
    }
    
}
