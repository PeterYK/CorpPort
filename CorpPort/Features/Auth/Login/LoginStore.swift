//
//  LoginStore.swift
//  CorpPort
//
//  Created by Peter Kozlov on 17.10.2026.
//

import Foundation

@Observable
final class LoginStore {
    private let appState: AppState
    
    var login = ""
    var password = ""
    var isLoading = false
    var errorMessage: String?
    
    init(appState: AppState) {
        self.appState = appState
    }
    
    func dispatch(_ action: LoginActions) {
        switch action {
        case .loginChanged(let value):
            login = value
            
        case .passwordChanged(let value):
            password = value
            
        case .loginTapped:
            performLogin()
            
        case .loginSucceeded:
            isLoading = false
            appState.isAuthenticated = true
            
        case .loginFailed(let message):
            isLoading = false
            errorMessage = message
        }
    }
    
    private func performLogin() {
        guard !login.isEmpty, !password.isEmpty else { return }
        
        isLoading = true
        errorMessage = nil
        
        // Пока без реальной проверки
        Task {
            dispatch(.loginSucceeded)
        }
    }
}
