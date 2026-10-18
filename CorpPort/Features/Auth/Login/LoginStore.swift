//
//  LoginStore.swift
//  CorpPort
//
//  Created by Peter Kozlov on 17.10.2026.
//

import SwiftUI

@Observable
final class LoginStore {
    @ObservationIgnored private var dataService: DataService = ServiceLocator.shared.getService()
    @ObservationIgnored private var NetworkService: NetworkService = ServiceLocator.shared.getService()

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
        
        // TODO: Пока без реальной проверки
        Task {
            do {
                try await dataService.loadAllData()
                await MainActor.run {
                    dispatch(.loginSucceeded)
                }
            } catch {
                await MainActor.run {
                    dispatch(.loginFailed("Не удалось загрузить данные"))
                }
            }
        }
    }
}
