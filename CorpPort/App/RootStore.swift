//
//  RootStore.swift
//  CorpPort
//
//  Created by Peter Kozlov on 17.10.2026.
//

import Foundation

@Observable
final class RootStore {
    let loginStore: LoginStore
    
    init(appState: AppState) {
        self.loginStore = LoginStore(appState: appState)
    }
}
