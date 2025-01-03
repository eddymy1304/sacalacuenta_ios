//
//  PreviewScreen.swift
//  sacalacuenta
//
//  Created by Eddy Mendoza on 9/12/24.
//

import SwiftUI

struct PreviewScreen : View {
    
    //@Environment(\.dismiss) var dismiss
    
    @ObservedObject var viewModel: ReceiptViewModel
    
    let id: String
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
            } else {
                VStack {
                    Image(systemName: "cart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.blue)
                        .padding()
                    
                    Text(
                        String(
                            format: NSLocalizedString("name_value", comment: ""), viewModel.receipt.title
                        )
                    )
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.body)
                    .padding(.horizontal, .paddingLarge)
                    
                    Text(
                        String(
                            format: NSLocalizedString("payment_method_value", comment: ""), viewModel.receipt.paymentMethod
                        )
                    )
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.body)
                    .padding(.horizontal, .paddingLarge)
                    .padding(.top, .paddingNormal)
                    
                    Text(
                        String(
                            format: NSLocalizedString("date_value", comment: ""), viewModel.receipt.date
                        )
                    )
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.body)
                    .padding(.horizontal, .paddingLarge)
                    .padding(.vertical, .paddingNormal)
                    
                    Divider()
                        .padding(.horizontal, .paddingLarge)
                    PreviewScreenCabItems()
                        .padding(.horizontal, .paddingLarge)
                    
                    List(viewModel.listItems) {item in
                        PreviewScreenItem(item: item)
                    }
                    .frame(height: 200)
                    .listStyle(.plain)
                    
                    Divider()
                    
                    Text(String(format: NSLocalizedString("text_total", comment: ""), viewModel.receipt.total))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.horizontal, .paddingLarge)
                    
                    HStack {
                        
                        Button(action: {
                            
                        }) {
                            Image(systemName: "square.and.arrow.up")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 36, height: 36)
                        }
                        .padding(.horizontal, .paddingExtraLarge)
                        
                        Button(action: {
                            //dismiss()
                        }) {
                            Image(systemName: "house")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 36, height: 36)
                        }
                        .padding(.horizontal, .paddingExtraLarge)
                    }
                    
                }
            }
        }
        .onAppear {
            viewModel.getReceiptWithListDetById(id: id)
        }
    }
    
}

#Preview {
    let viewModel = diPreview()
    PreviewScreen(viewModel: viewModel, id: "")
}
