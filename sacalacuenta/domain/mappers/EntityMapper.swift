//
//  EntityMapper.swift
//  sacalacuenta
//
//  Created by Eddy Mendoza on 16/12/24.
//

protocol EntityMapper {
    
    associatedtype Domain
    associatedtype Entity
    
    func asDomain(entity: Entity) -> Domain
    
    func asEntity(domain: Domain) -> Entity
    
}
