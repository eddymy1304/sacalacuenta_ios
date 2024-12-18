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
    
    private let db = DatabaseContainer()
    
    private var context: ModelContext {
        db.container.mainContext
    }

    var body: some Scene {
        
        let repository = ReceiptRepositoryImpl(context: context)
        
        let getPaymentMethodsUseCase = GetPaymentMethodsUseCase(repository: repository)
        
        let saveReceiptUseCase = SaveReceiptUseCase(repository: repository)
        
        let viewmodel = ReceiptViewModel(getPaymentMethodsUseCase: getPaymentMethodsUseCase, saveReceiptUseCase: saveReceiptUseCase)
        
        WindowGroup {
            ContentView(viewModel: viewmodel)
        }
    }
}
