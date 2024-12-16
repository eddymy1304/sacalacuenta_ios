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
    
    @FocusState var focusedField: ReceiptScreen.FocusedFieldItem?
    
    let onClickTrash: () -> Void
    
    
    var body: some View {
        
        let positionText = String(
            format: NSLocalizedString("position", comment: ""),
            position + 1
        )
        
        VStack {
            
            HStack {
                
                Text(positionText)
                
                VStack {
                    
                    HStack {
                        
                        TextField("product", text: $item.name)
                            .font(.title3)
                            .onChange(of: item.name) { oldValue, newValue in
                                item.name = newValue
                            }
                            .padding(.horizontal, .paddingLarge)
                            .focused($focusedField, equals: .name(item.id))
                        
                        
                        let iconItemLocked = if(item.itemLocked){"lock"}
                        else {"lock.open"}
                        
                        Image(systemName: iconItemLocked)
                            .frame(width: 44, height: 44)
                            .onTapGesture {
                                withAnimation{
                                    item.itemLocked.toggle()
                                }
                                
                                item.textAmount = ""
                                item.textPrice = ""
                                item.price = 0.00
                                item.amount = 0.00
                                item.total = 0.00
                                item.textTotal = "0.00"
                                
                                if item.name.isEmpty {
                                    focusedField = .name(item.id)
                                } else {
                                    if item.itemLocked {
                                        focusedField = .total(item.id)
                                    } else {
                                        focusedField = .amount(item.id)
                                    }
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
                            onChange: { _, newValue in
                                item.textAmount = filterTextToNumberDecimal(text: newValue)
                                item.amount = Double(item.textAmount) ?? 0.00
                                updateTotal()
                            }
                        )
                        .focused($focusedField, equals: .amount(item.id))
                        
                        BasicOutlinedTextfield(
                            text: $item.textPrice,
                            hint: "price",
                            enabled: !item.itemLocked,
                            keyboardType: .decimalPad,
                            onChange: { _, newValue in
                                item.textPrice = filterTextToNumberDecimal(text: newValue)
                                item.price = Double(item.textPrice) ?? 0.00
                                updateTotal()
                            }
                        )
                        .focused($focusedField, equals: .price(item.id))
                        
                        BasicOutlinedTextfield(
                            text: $item.textTotal,
                            hint: "total",
                            enabled: item.itemLocked,
                            keyboardType: .decimalPad,
                            onChange: { _, newValue in
                                item.textTotal = filterTextToNumberDecimal(text: newValue)
                                item.total = Double(item.textTotal) ?? 0.00
                            }
                        )
                        .focused($focusedField, equals: .total(item.id))
                        
                    }.padding(.horizontal, .paddingLarge)
                    
                    
                }.padding(.vertical, .paddingNormal)
                
            }
            
        }.frame(minHeight: 100)
    }
    
    
    func filterTextToNumberDecimal(text: String) -> String {
        
        let filter = text.filter { "0123456789.".contains($0) }
        
        if filter.components(separatedBy: ".").count > 2 {
            return String(filter.dropLast())
        } else {
            return filter
        }
    }
    
    func updateTotal() {
        item.total = getTotal(amount: item.amount, price: item.price)
        item.textTotal = getTextTotal(total: item.total)
    }
    
    func getTotal(amount: Double, price: Double)  -> Double {
        return amount * price
    }
    
    func getTextTotal(total: Double) -> String {
        return String(format: NSLocalizedString("number_decimal", comment: ""), total)
    }
}

#Preview {
    
    @Previewable @State var item = ItemReceiptView(
        name: "",
        amount: 1,
        price: 12.5
    )
    
    @FocusState var focus: ReceiptScreen.FocusedFieldItem?
    
    ReceiptItem(item: $item, position: 1, focusedField: _focus) {
        
    }
}
