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
    private let configurator = Configurator()
    @State private var appState = AppState()
    @State private var rootStore: RootStore

    init() {
        let appState = AppState()
        _appState = State(initialValue: appState)
        _rootStore = State(initialValue: RootStore(appState: appState))
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(appState)
                .environment(rootStore)
        }
    }
}
