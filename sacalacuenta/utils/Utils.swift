//
//  Utils.swift
//  sacalacuenta
//
//  Created by Eddy Mendoza on 2/12/24.
//

import Foundation
import SwiftUI

struct Utils {
    
    static func getFormattedDecimal(_ value: Double?) -> String {
        if value == nil {
            return ""
        }
        
        return String(format: "%.2f", value!)
    }
    
    static func formatDateToString(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter.string(from: date)
    }
    
    static func formatDateToStringWithTime(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        return formatter.string(from: date)
    }
    
    static func getCurrentDate() -> Date {
        return Date()
    }
    
}
