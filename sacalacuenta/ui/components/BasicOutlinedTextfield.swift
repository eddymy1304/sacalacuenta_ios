//
//  BasicOutlinedTextfield.swift
//  sacalacuenta
//
//  Created by Eddy Mendoza on 2/12/24.
//

import SwiftUI

struct BasicOutlinedTextfield: View {
    
    @Binding var text: String
    
    var hint: String = ""
    
    var enabled: Bool = true
    
    var keyboardType: UIKeyboardType = .default
    
    var onChange: (_ oldValue:String, _ newValue:String) -> Void
    
    @FocusState private var isFocused: Bool
    
    
    var body: some View {
        
        let lineWidth: CGFloat = withAnimation {
            if isFocused || !text.isEmpty{ .focusedBorderWidth }
            else { .unfocusedBorderWidth }
        }
        
        let placeholder = if isFocused { "" } else { hint }
        
        TextField(placeholder, text: $text)
            .focused($isFocused)
            .disabled(!enabled)
            .keyboardType(keyboardType)
            .onChange(of: text) { oldValue, newValue in
                onChange(oldValue, newValue)
            }
            .padding(.vertical, .paddingNormal)
            .padding(.horizontal, .paddingLarge)
            .overlay {
                
                ZStack(alignment: .leading) {
                    
                    RoundedRectangle(cornerRadius: .radiusSmall)
                        .stroke(
                            Color.gray,
                            lineWidth: lineWidth
                        )
                    
                    if (isFocused || !text.isEmpty) && !hint.isEmpty {
                        Text(hint)
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding(.horizontal, .paddingSmall)
                            .background(.white)
                            .padding(.horizontal, .paddingNormal)
                            .offset(y: -22)
                            .scaleEffect(0.9, anchor: .leading)
                    }
                    
                }
                
            }
            .animation(.easeInOut, value: isFocused)
    }
}

#Preview {
    
    @Previewable @State var textito: String = ""
    
    @Previewable let hint = "product"
    
    BasicOutlinedTextfield(
        text: $textito,
        hint: "Producto",
        onChange: { oldValue, newValue in
            print(newValue)
        }
    )
}
