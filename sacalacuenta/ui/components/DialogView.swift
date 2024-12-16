//
//  DialogView.swift
//  sacalacuenta
//
//  Created by Eddy Mendoza on 15/12/24.
//

import SwiftUI

struct DialogView<V:View>: View {
    
    // onDismiss
    let onDismiss: () -> Void
    
    // cancelable
    let cancelable: Bool
    
    let content: () -> V
    
    
    var body: some View {
        ZStack{
            // Parte opaca de un dialog
            Rectangle()
                .fill(.gray.opacity(0.7))
                .ignoresSafeArea()
                .onTapGesture {
                    if cancelable {
                        withAnimation{
                            onDismiss()
                        }
                    }
                }
            
            content()
                .frame(
                    width: UIScreen.main.bounds.width - 80
                )
                .padding(.paddingNormal)
                .background(.white)
                .cornerRadius(.radiusNormal)
        }
        .ignoresSafeArea()
        .frame(
            width: UIScreen.main.bounds.size.width,
            height: UIScreen.main.bounds.size.height,
            alignment: .center
        )
    }
}

#Preview {
    DialogView(
        onDismiss: {},
        cancelable: false
    ) {
        VStack {
            Text("Title")
            Text("Description")
            
        }
    }
}

struct BasicDialog : View {
    
    let title: String
    
    let description: String
    
    let onDismiss: () -> Void
    
    let cancelable: Bool
    
    var textClickPositive: String = "aceptar"
    
    var textClickNegative: String = "cancelar"
    
    var showClickNegative: Bool = true
    
    let onClickPositive: () -> Void
    
    var onClickNegative: () -> Void = {}
    
    var body: some View {
        let textTitle =
        String(format: NSLocalizedString(title, comment: ""))
        let textDescription =
        String(format: NSLocalizedString(description, comment: ""))
        DialogView(onDismiss: onDismiss, cancelable: cancelable) {
            VStack {
                
                Text(textTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title)
                    .bold()
                    .padding()
                    .lineLimit(0)
                
                
                Text(textDescription)
                    .font(.body)
                    .lineLimit(4)
                
                HStack {
                    
                    if showClickNegative {
                        Button(action: {
                            onDismiss()
                            onClickNegative()
                        }) {
                            Text(NSLocalizedString("cancelar", comment: ""))
                                .foregroundColor(.red)
                                .padding()
                        }
                    }
                    
                    Button(action: {
                        onDismiss()
                        onClickPositive()
                    }) {
                        Text(NSLocalizedString("aceptar", comment: ""))
                            .foregroundColor(.blue)
                            .padding()
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.paddingSmall)
                
            }
        }
        
    }
}

#Preview{
    BasicDialog(
        title: "Title",
        description: "Description: esta seguro que desea guardar la informacion?",
        onDismiss: {},
        cancelable: false,
        showClickNegative: false,
        onClickPositive: {},
        onClickNegative: {}
    )
    
}
