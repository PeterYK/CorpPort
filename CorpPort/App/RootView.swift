//
//  RootView.swift
//  CorpPort
//
//  Created by Peter Kozlov on 14.10.2026.
//

import SwiftUI

struct RootView: View {
    @Environment(AppState.self) var appState
    
    var body: some View {
//        if appState.isAuthenticated {
            MainTabView()
//        } else {
//            LoginView()
//        }
    }
}
