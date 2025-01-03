//
//  ContentView.swift
//  sacalacuenta
//
//  Created by Eddy Mendoza on 27/11/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @StateObject private var viewModel: ReceiptViewModel
    
    init(viewModel: ReceiptViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    @State private var selectedIndex = 0
    
    var body: some View {
        
        let screens = getScreens(viewModel: viewModel)
        NavigationStack { 
            VStack {
                
                TabView(selection: $selectedIndex) {
                    ForEach(screens.indices, id: \.self) { index in
                        let screen = screens[index]
                        let text = String(format: NSLocalizedString(screen.title, comment: ""))
                        
                        screen
                            .view
                            .tabItem {
                                Label(text,systemImage: screen.icon)
                            }
                            .tag(index)
                        
                    }
                }
            }
            .toolbar {
                
                ToolbarItem(placement: .topBarLeading) {
                    Text(
                        String(format: NSLocalizedString(screens[selectedIndex].title, comment: ""))
                    )
                }
                
                ToolbarItem(placement:.automatic) {
                    
                    if(selectedIndex == 0) {
                        
                        Button(action: { }) {
                            Image(systemName: ScreenSettings(view: AnyView(EmptyView())).icon)
                        }
                        
                    }
                }
            }
            .overlay {
                ToastView(toast: viewModel.toast)
                DialogSaveReceipt(viewModel: viewModel)
            }
        }
        
        
    }
    
}

#Preview {
    let viewModel = diPreview()
    ContentView(viewModel: viewModel)
}
