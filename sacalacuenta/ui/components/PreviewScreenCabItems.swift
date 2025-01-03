//
//  PreviewScreenCabItems.swift
//  sacalacuenta
//
//  Created by Eddy Mendoza on 18/12/24.
//

import SwiftUI

struct PreviewScreenCabItems: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                
                HStack(spacing: 0) {
                    Text("product")
                        .frame(width: geometry.size.width * 0.4, alignment: .leading)
                    
                    Text("cant")
                        .frame(width: geometry.size.width * 0.15, alignment: .leading)
                    
                    Text("pu")
                        .frame(width: geometry.size.width * 0.15, alignment: .leading)
                    
                    Text("total")
                        .frame(width: geometry.size.width * 0.3, alignment: .trailing)
                }
                Divider()
            }
            
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    PreviewScreenCabItems()
}
