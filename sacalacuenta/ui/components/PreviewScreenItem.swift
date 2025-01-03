//
//  PreviewScreenItem.swift
//  sacalacuenta
//
//  Created by Eddy Mendoza on 18/12/24.
//

import SwiftUI

struct PreviewScreenItem: View {
    
    let item : ReceiptDetView
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                Text(item.name)
                    .frame(width: geometry.size.width * 0.4, alignment: .leading)
                Text(item.textAmount)
                    .frame(width: geometry.size.width * 0.15, alignment: .trailing)
                Text(item.textPrice)
                    .frame(width: geometry.size.width * 0.15, alignment: .trailing)
                Text(item.textTotal)
                    .frame(width: geometry.size.width * 0.3, alignment: .trailing)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    PreviewScreenItem(item: ReceiptDetView(
        name: "Pollo",
        textAmount: "-",
        textPrice: "-",
        textTotal: "10.00"
    ))
}
