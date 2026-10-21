//
//  LoginStore.swift
//  CorpPort
//
//  Created by Peter Kozlov on 17.10.2026.
//

import SwiftUI

@Observable
final class LoginStore {
    @ObservationIgnored private var dataService: DataService
    @ObservationIgnored private var networkService: NetworkService
    @ObservationIgnored private var keychainService: KeychainService

    private let appState: AppState
    
    var login = ""
    var password = ""
    var isLoading = false
    var errorMessage: String?
    
    var appVersion: String {
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "—"
        let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String
        if let build {
            return "\(version) (\(build))"
        }
        return version
    }
  
    init(
        appState: AppState,
        networkService: NetworkService = ServiceLocator.shared.getService(),
        keychainService: KeychainService = ServiceLocator.shared.getService(),
        dataService: DataService = ServiceLocator.shared.getService()
    ) {
        self.appState = appState
        self.networkService = networkService
        self.keychainService = keychainService
        self.dataService = dataService
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
            login = ""
            password = ""
            
        case .loginFailed(let message):
            isLoading = false
            errorMessage = message
        }
    }
}

extension LoginStore {
    
    private func performLogin() {
        guard !login.isEmpty, !password.isEmpty else { return }
        
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                let token = try await networkService.login(login: login, password: password)
                keychainService.saveToken(token)
                
                try await dataService.loadAllData()
                
                await MainActor.run {
                    dispatch(.loginSucceeded)
                }
            } catch {
                await MainActor.run {
                    dispatch(.loginFailed("Неверный логин или пароль"))
                }
            }
        }
    }
    
    func tryAutoLogin() async {
        guard let token = keychainService.getToken() else { return }
        isLoading = true
        
        do {
            let isValid = try await networkService.validateToken(token)
            if isValid {
                try await dataService.loadAllData()
                await MainActor.run {
                    dispatch(.loginSucceeded)
                }
            } else {
                keychainService.deleteToken()
                isLoading = false
            }
        } catch {
            keychainService.deleteToken()
            isLoading = false
        }
    }
}
