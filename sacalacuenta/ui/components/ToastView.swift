//
//  ToastView.swift
//  sacalacuenta
//
//  Created by Eddy Mendoza on 12/12/24.
//

import SwiftUI

struct ToastView: View {
    let toast: Toast
    var body: some View {
        VStack {
            Spacer()
            if toast.show && !toast.text.isEmpty {
                let text = String(format: NSLocalizedString(toast.text, comment: ""))
                Text(text)
                    .padding()
                    .background(Color.black.opacity(0.6))
                    .foregroundColor(.white)
                    .cornerRadius(.radiusMedium)
                    .padding()
                    .shadow(radius: .radiusMedium)
                    .transition(.opacity)
                    .animation(.easeInOut, value: toast.show)
            }
        }
    }
}

struct Toast {
    var show: Bool = false
    var text:String = ""
    var duration: DispatchTimeInterval = .toastDurationShort
}

struct DurationToast {
    static let short: DispatchTimeInterval = .seconds(3)
    static let long: DispatchTimeInterval = .seconds(6)
}

extension DispatchTimeInterval {
    static let toastDurationShort: DispatchTimeInterval = DurationToast.short
    static let toastDurationLong: DispatchTimeInterval = DurationToast.long
}

#Preview {
    //var toast: Toast = .init()
    //ToastView(toast: toast)
}
