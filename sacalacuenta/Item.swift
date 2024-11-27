//
//  Item.swift
//  sacalacuenta
//
//  Created by Eddy Mendoza on 27/11/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
