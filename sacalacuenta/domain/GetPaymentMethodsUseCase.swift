//
//  GetListPaymentMethodsUseCase.swift
//  sacalacuenta
//
//  Created by Eddy Mendoza on 16/12/24.
//

class GetPaymentMethodsUseCase {
    
    private let repository : ReceiptRepository
    
    init(repository : ReceiptRepository) {
        self.repository = repository
    }
    
    func execute() -> [PaymentMethodView] {
        return repository
            .getListPaymentMethods()
            .asDomain()
            .sorted { $0.name < $1.name }
    }
    
}
