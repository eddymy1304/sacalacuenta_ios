//
//  ReceiptViewModel.swift
//  sacalacuenta
//
//  Created by Eddy Mendoza on 6/12/24.
//

import Foundation
import Combine

@MainActor
class ReceiptViewModel: BaseViewModel {
    
    @Published var receipt: ReceiptView = ReceiptView()
    @Published var listItems: [ReceiptDetView] = []
    
    @Published private(set) var paymentMethods: [PaymentMethodView] = []
    
    @Published private(set) var showDialogSave: Bool = false
    
    private let getPaymentMethodsUseCase : GetPaymentMethodsUseCase
    
    
    init(getPaymentMethodsUseCase: GetPaymentMethodsUseCase) {
        
        self.getPaymentMethodsUseCase = getPaymentMethodsUseCase
        
        super.init()
        
        getPaymentMethods()
        
    }
    
    func getPaymentMethods() {
        paymentMethods = getPaymentMethodsUseCase.execute()
    }
    
    func addItem(item: ReceiptDetView) {
        listItems.append(item)
    }
    
    func removeItem(item: ReceiptDetView) {
        listItems.removeAll { $0 == item }
    }
    
    func onTitleReceiptChanged(title: String) {
        receipt.title = title
    }
    
    func onPaymentMethodReceiptChanged(paymentMethod: String) {
        receipt.paymentMethod = paymentMethod
    }
    
    func preSaveReceipt() {
        if validateReceipt() {
            showDialogSave = true
        }
    }
    
    func saveReceipt() {
        
    }
    
    func validateReceipt() -> Bool {
        
        if receipt.title.isEmpty {
            makeToast(text: "error_title")
            return false
        }
        
        if receipt.paymentMethod.isEmpty {
            makeToast(text: "error_payment_method")
            return false
        }
        
        if listItems.isEmpty {
            makeToast(text: "error_empty_list")
            return false
        }
        
        if listItems.reduce(0.00, { $0 + $1.total }) <= 0.00 {
            makeToast(text: "error_total_zero")
            return false
        }
        
        return true
    }
    
    func setShowDialogSave(show: Bool) {
        showDialogSave = show
    }
}
