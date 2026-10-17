//
//  LoginView.swift
//  CorpPort
//
//  Created by Peter Kozlov on 14.10.2026.
//

import SwiftUI

struct LoginView: View {
    @Environment(AppState.self) var appState
    @State private var login = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Вход в портал")
                .font(.largeTitle.bold())
            
            TextField("Логин", text: $login)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.never)
            
            SecureField("Пароль", text: $password)
                .textFieldStyle(.roundedBorder)
            
            Button("Войти") {
                // Пока без проверки — просто входим
                appState.isAuthenticated = true
            }
            .buttonStyle(.borderedProminent)
            .disabled(login.isEmpty || password.isEmpty)
        }
        .padding()
    }
}
