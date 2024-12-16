//
//  BaseViewModel.swift
//  sacalacuenta
//
//  Created by Eddy Mendoza on 11/12/24.
//

import Foundation

@MainActor
class BaseViewModel : ObservableObject {
    
    @Published private(set) var isLoading = false
    @Published private(set) var toast: Toast = Toast()
    
    func startLoading() {
        isLoading = true
    }
    
    func stopLoading() {
        isLoading = false
    }
    
    func makeToast(text: String, duration: DispatchTimeInterval = .toastDurationShort) {
        toast.text = text
        toast.duration = duration
        toast.show = true
        let deadline = DispatchTime.now() + toast.duration
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            self.toast.show = false
        }
    }
}
