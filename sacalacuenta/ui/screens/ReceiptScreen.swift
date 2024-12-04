//
//  ReceiptScreen.swift
//  sacalacuenta
//
//  Created by Eddy Mendoza on 29/11/24.
//

import SwiftUI

struct ReceiptScreen: View {
    
    @State var receipt = ReceiptView()
    
    @State var listItems: [ItemReceiptView] = []
    
    
    var body: some View {
        VStack {
            
            TextField("title", text: $receipt.title)
                .font(.title2)
                .onChange(of: receipt.title) { oldValue, newValue in
                    receipt.title = newValue
                }
                .padding(.horizontal, .paddingLarge)
                .padding(.vertical, .paddingExtraLarge)
            
            HStack {
                TextField("payment_method", text: $receipt.paymentMethod)
                    .font(.headline)
                    .onChange(of: receipt.paymentMethod) { oldValue, newValue in
                        receipt.paymentMethod = newValue
                    }
                    .padding(.horizontal, .paddingLarge)
                
                let totalText = String(format: NSLocalizedString("text_total", comment: ""), receipt.total)
                
                Text(totalText)
                    .font(.title)
                    .padding(.horizontal, .paddingLarge)
            }
            
            Divider()
                .frame(height: 2)
                .padding(.horizontal, .paddingLarge)
            
            List {
                ForEach(listItems.indices, id: \.self) { index in
                    ReceiptItem(item: $listItems[index], position:index) {
                        listItems.remove(at: index)
                    }
                }
            }.listStyle(.plain)
        
            
            HStack {
                
                Button(action: {
                    
                }) {
                    HStack {
                        Image(systemName: "checkmark")
                            .font(.title)
                        
                        
                        Text("save")
                            .font(.title2)
                    }
                    .padding(.horizontal, .paddingLarge)
                    .frame(height: 56)
                    .foregroundColor(.white)
                    .background(
                        RoundedRectangle(cornerRadius: .radiusMedium)
                            .fill(.purple40)
                    )
                    .shadow(radius: .radiusNormal)
                    
                }
                .padding(.paddingLarge)
                
                
                Spacer()
                
                Button(action: {
                    listItems.append(ItemReceiptView())
                }) {
                    Image(systemName: "plus" )
                        .font(.title)
                        .frame(width: 56, height: 56)
                        .foregroundColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: .radiusMedium)
                                .fill(.purple40)
                        )
                        .shadow(radius: .radiusNormal)
                }
                .accessibilityLabel("fab_desc")
                .padding(.paddingLarge)
            }
            
            
        }
    }
}

#Preview {
    ReceiptScreen()
}
