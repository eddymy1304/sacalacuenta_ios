//
//  sacalacuentaApp.swift
//  sacalacuenta
//
//  Created by Eddy Mendoza on 27/11/24.
//

import SwiftUI
import SwiftData

@main
struct sacalacuentaApp: App {

    var body: some Scene {
        
        let viewmodel = ReceiptViewModel()
        
        WindowGroup {
            ContentView(viewModel: viewmodel)
        }
    }
}
