//
//  DatabaseContainer.swift
//  sacalacuenta
//
//  Created by Eddy Mendoza on 4/12/24.
//

import Foundation
import SwiftData

class DatabaseContainer {
    
    let container: ModelContainer
    
    init() {
        
        let schema = Schema(
            [ReceiptEntity.self,
             ReceiptDetEntity.self
            ]
        )
        
        let config = ModelConfiguration("sacalacuenta", schema: schema, isStoredInMemoryOnly: false, allowsSave: true)
        
        do {
            container = try ModelContainer(for: schema, configurations: config)
        } catch {
            fatalError("Not Init DatabaseContainer")
        }
        
    }
    
}
