//
//  OutlinedTextfield.swift
//  sacalacuenta
//
//  Created by Eddy Mendoza on 30/11/24.
//

import SwiftUI

struct OutlinedTextfield: View {
    
    @Binding var text: String
    let label: String
    let placeholder: String
    let errorMessage: String?
    let isError: Bool
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            ZStack(alignment: .leading) {
                if isFocused || !text.isEmpty {
                    Text(label)
                        .font(.caption)
                        .foregroundColor(isError ? .red : isFocused ? .blue : .gray)
                        .padding(.horizontal, 8)
                        .background(.white)
                        .offset(y: -20)
                        .scaleEffect(0.9, anchor: .leading)
                }
                
                TextField(placeholder, text: $text)
                    .focused($isFocused)
                    .padding(12)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(
                                isError ? .red :(isFocused ? Color.blue : .gray),
                                lineWidth: 2
                            )
                    }
                    .animation(
                        .easeInOut(duration: 0.2),
                        value: isFocused || !text.isEmpty
                    )
            }
            .padding(.top, 8)
            
            if let errorMessage = errorMessage, isError {
                Text(errorMessage)
                    .font(.caption)
                    .foregroundColor(.red)
                    .padding(.top, 2)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    
    @Previewable @State var text: String = ""
    
    OutlinedTextfield(
        text: $text,
        label: "Nombre",
        placeholder: "Ingresa tu nombre",
        errorMessage: "Este campo es requerido",
        isError: false
    )
}
