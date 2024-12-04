//
//  EntityMapper.swift
//  sacalacuenta
//
//  Created by Eddy Mendoza on 4/12/24.
//

protocol EntityMapper {
    
    associatedtype Domain
    associatedtype Entity
    
    func asDomain(entity: Entity) -> Domain
    
    func asEntity(domain: Domain) -> Entity
    
}
