//
//  Screens.swift
//  sacalacuenta
//
//  Created by Eddy Mendoza on 11/12/24.
//

import SwiftUI

protocol Screen: Identifiable {
    var id: String { get }
    var title: String { get }
    var icon: String { get }
    var view: AnyView { get }
}

struct ScreenReceipt : Screen {
    
    let id: String = "ScreenReceipt"
    
    let title: String = "title_receipt"
    
    let icon: String = "cart"
    
    var view: AnyView
    
}

struct ScreenPreview : Screen {
    
    let id: String = "ScreenPreview"
    
    let title: String = "title_preview"
    
    let icon: String = "list.bullet.clipboard"
    
    var view: AnyView
    
}

struct ScreenSettings : Screen {
    
    let id: String = "ScreenSettings"
    
    let title: String = "title_settings"
    
    let icon: String = "gear"
    
    var view: AnyView
    
}

struct ScreenHistory : Screen {
    
    let id: String = "ScreenHistory"
    
    let title: String = "title_history"
    
    let icon: String = "list.bullet"
    
    var view: AnyView
    
}

func getScreens(viewModel: ReceiptViewModel) -> [any Screen] {
    return [
        ScreenReceipt(view: AnyView(ReceiptScreen(viewModel: viewModel))),
        ScreenHistory(view: AnyView(HistoryScreen()))
    ]
}
