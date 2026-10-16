//
//  CorpPortApp.swift
//  CorpPort
//
//  Created by Peter Kozlov on 13.10.2026.
//

import SwiftUI
import SwiftData

@main
struct CorporatePortalApp: App {
    @State private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(appState)
        }
    }
}
