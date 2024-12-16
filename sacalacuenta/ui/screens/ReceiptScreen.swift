//
//  ReceiptScreen.swift
//  sacalacuenta
//
//  Created by Eddy Mendoza on 29/11/24.
//
import SwiftUI

struct ReceiptScreen: View {
    
    @ObservedObject var viewModel : ReceiptViewModel
    
    @FocusState private var focusedFieldItem: FocusedFieldItem?
    
    enum FocusedFieldItem: Hashable {
        case name(String)
        case amount(String)
        case price(String)
        case total(String)
    }
    
    var body: some View {
        
            VStack {
                
                ReceiptScreenHeader(
                    receipt: $viewModel.receipt,
                    total: viewModel.listItems.reduce(0) { $0 + $1.total }
                )
                
                ReceiptScreenContent(
                    list: $viewModel.listItems,
                    focusedFieldItem: _focusedFieldItem
                ) { item in
                    viewModel.removeItem(item: item)
                }
                
                ReceiptScreenFooter {
                    viewModel.addItem(item: ItemReceiptView())
                } onClickSave: {
                    viewModel.preSaveReceipt()
                }

            }
            
    }
}

struct ReceiptScreenContent: View {
    
    @Binding var list: [ItemReceiptView]
    
    @FocusState var focusedFieldItem: ReceiptScreen.FocusedFieldItem?
    
    var onClickTrashItem : ( _ item: ItemReceiptView) -> Void
    
    var body: some View {
        ScrollViewReader { proxy in
        
        List(list.indices, id: \.self) { index in
            
            ReceiptItem(
                item: $list[index],
                position: index,
                focusedField: _focusedFieldItem
            ) {
                onClickTrashItem(list[index])
            }
            .id(index)
            
        }
        .listStyle(.plain)
        .onChange(of: list) { _, newValue in
            if let lastIndex = newValue.indices.last {
                withAnimation {
                    proxy.scrollTo(lastIndex, anchor: .bottom)
                }
            }
        }
        
    }
    }
}

struct ReceiptScreenFooter: View {
    
    var onClickPlus: () -> Void
    
    var onClickSave: () -> Void
    
    var body: some View {
        HStack {
            
            Button(action: onClickSave) {
                HStack {
                    Image(systemName: "checkmark")
                        .font(.title)
                    
                    
                    Text("save")
                        .font(.title3)
                }
                .padding(.horizontal, .paddingLarge)
                .frame(height: 44)
                .foregroundColor(.white)
                .background(
                    RoundedRectangle(cornerRadius: .radiusMedium)
                        .fill(.purple40)
                )
                .shadow(radius: .radiusNormal)
                
            }
            .padding(.paddingMedium)
            
            
            Spacer()
            
            Button(action: onClickPlus) {
                Image(systemName: "plus" )
                    .font(.title)
                    .frame(width: 44, height: 44)
                    .foregroundColor(.white)
                    .background(
                        RoundedRectangle(cornerRadius: .radiusMedium)
                            .fill(.purple40)
                    )
                    .shadow(radius: .radiusNormal)
            }
            .accessibilityLabel("fab_desc")
            .padding(.paddingMedium)
        }
    }
}

struct ReceiptScreenHeader: View {
    
    @Binding var receipt: ReceiptView
    
    let total: Double
    
    var body: some View {
        VStack {
            
            TextField("title", text: $receipt.title)
                .font(.title2)
                .onChange(of: receipt.title) { _, newValue in
                    receipt.title = newValue
                }
                .padding(.horizontal, .paddingLarge)
                .padding(.vertical, .paddingNormal)
            
            HStack {
                TextField("payment_method", text: $receipt.paymentMethod)
                    .font(.headline)
                    .onChange(of: receipt.paymentMethod) { _, newValue in
                        receipt.paymentMethod = newValue
                    }
                    .padding(.trailing, .paddingNormal)
                
                let totalText = String(format: NSLocalizedString("text_total", comment: ""),total)
                
                Text(totalText)
                    .lineLimit(1)
                    .font(.title2)
            }
            .padding(.horizontal, .paddingLarge)
            
            Divider()
                .frame(height: 2)
                .padding(.horizontal, .paddingLarge)
        }
    }
}

struct DialogSaveReceipt : View {
    
    @ObservedObject var viewModel: ReceiptViewModel
    
    var body: some View {
        if viewModel.showDialogSave {
            BasicDialog(
                title: "dialog_save_receipt_title",
                description: "dialog_save_receipt_desc",
                onDismiss:  { viewModel.setShowDialogSave(show: false) },
                cancelable: false,
                onClickPositive: {
                    viewModel.saveReceipt()
                }
            )
        }
    }
}

#Preview {
    let viewModel = ReceiptViewModel()
    ReceiptScreen(viewModel: viewModel)
}
