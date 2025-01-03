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
    
    @Published private(set) var completeSave: Bool = false
    
    private let getPaymentMethodsUseCase : GetPaymentMethodsUseCase
    
    private let saveReceiptUseCase: SaveReceiptUseCase
    
    private let getReceiptWithListDetById : GetReceiptWithListDetById
    
    init(getPaymentMethodsUseCase: GetPaymentMethodsUseCase,
         saveReceiptUseCase: SaveReceiptUseCase,
         getReceiptWithListDetById: GetReceiptWithListDetById
    ) {
        
        self.getPaymentMethodsUseCase = getPaymentMethodsUseCase
        self.saveReceiptUseCase = saveReceiptUseCase
        self.getReceiptWithListDetById = getReceiptWithListDetById
        
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
        Task {
            
            do {
                try await saveReceiptUseCase.execute(receipt: self.receipt, listDet: self.listItems)
                DispatchQueue.main.async {
                    self.completeSave = true
                    self.makeToast(text: "Receipt saved")
                }
            } catch {
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.makeToast(text: "Error saving receipt")
                }
            }
            
        }
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
    
    func getReceiptWithListDetById(id: String) {
        Task {
            
            startLoading()
            do {
                let result = try await getReceiptWithListDetById.execute(id: id)
                DispatchQueue.main.async {
                    self.receipt = result.receipt
                    self.listItems = result.listDet
                }
                stopLoading()
            } catch {
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.makeToast(text: "Error get receipt")
                }
                stopLoading()
            }
            
            
        }
    }
    
    func clearReceipt() {
        receipt = .init()
        listItems.removeAll()
        showDialogSave = false
        completeSave = false
    }
}
