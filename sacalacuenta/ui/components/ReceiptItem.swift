//
//  ReceiptItem.swift
//  sacalacuenta
//
//  Created by Eddy Mendoza on 2/12/24.
//

import SwiftUI

struct ReceiptItem: View {
    
    @Binding var item: ItemReceiptView
    
    var position: Int
    
    let onClickTrash: () -> Void
    
    var body: some View {
        
        let positionText = String(
            format: NSLocalizedString("position", comment: ""),
            position + 1
        )
        
        VStack {
            
            HStack {
                
                VStack {
                    Text(positionText)
                    Spacer()
                }
                
                VStack {
                    
                    HStack {
                        
                        TextField("product", text: $item.name)
                            .font(.title3)
                            .onChange(of: item.name) { oldValue, newValue in
                                item.name = newValue
                            }
                            .padding(.horizontal, 16)
                        
                        
                        let iconItemLocked = if(item.itemLocked){"lock"}
                        else {"lock.open"}
                        
                        withAnimation{
                            Image(systemName: iconItemLocked)
                                .frame(width: 44, height: 44)
                                .onTapGesture {
                                    item.itemLocked.toggle()
                                }
                        }
                        
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                            .frame(width: 44, height: 44)
                            .onTapGesture {
                                onClickTrash()
                            }
                        
                    }
                    
                    
                    HStack {
                        
                        BasicOutlinedTextfield(
                            text: $item.textAmount,
                            hint: "amount",
                            enabled: !item.itemLocked,
                            keyboardType: .decimalPad,
                            onChange: { oldValue, newValue in
                                item.textAmount = newValue
                                item.amount =   Double(newValue) ?? 0.00
                            }
                        )
                        
                        BasicOutlinedTextfield(
                            text: $item.textPrice,
                            hint: "price",
                            enabled: !item.itemLocked,
                            keyboardType: .decimalPad,
                            onChange: { oldValue, newValue in
                                item.textPrice = newValue
                                item.price =   Double(newValue) ?? 0.00
                            }
                        )
                        
                        BasicOutlinedTextfield(
                            text: $item.textTotal,
                            hint: "total",
                            enabled: item.itemLocked,
                            keyboardType: .decimalPad,
                            onChange: { oldValue, newValue in
                                item.textTotal = newValue
                                item.total =   Double(newValue) ?? 0.00
                            }
                        )
                        
                    }.padding(.horizontal, .paddingLarge)
                    
                    Spacer()
                }
                
            }
            
            //Divider()
            //  .frame(height: 2)
            
        }.frame(width: .infinity, height: 80)
    }
}

#Preview {
    
    @Previewable @State var item = ItemReceiptView(
        name: "pollo",
        amount: 1,
        price: 12.5
    )
    
    ReceiptItem(item: $item, position: 1) {
        
    }
}
