//
//  ContentView.swift
//  sacalacuenta
//
//  Created by Eddy Mendoza on 27/11/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    var body: some View {
        VStack {
            
            
            VStack {
                Text("name_app")
                    .font(.title)
                Text("")
            }
            .frame(height:200)        }
    }
    
}

#Preview {
    ContentView()
        .environment(\.locale, .init(identifier: "en"))
}
