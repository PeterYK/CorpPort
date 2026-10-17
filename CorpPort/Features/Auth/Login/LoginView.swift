//
//  LoginView.swift
//  CorpPort
//
//  Created by Peter Kozlov on 14.10.2026.
//

import SwiftUI

struct LoginView: View {
    @Environment(RootStore.self) var rootStore
    
    var body: some View {
        let store = rootStore.loginStore
        
        VStack(spacing: 16) {
            TextField("Логин", text: Binding(
                get: { store.login },
                set: { store.dispatch(.loginChanged($0)) }
            ))
            .textFieldStyle(.roundedBorder)
            
            SecureField("Пароль", text: Binding(
                get: { store.password },
                set: { store.dispatch(.passwordChanged($0)) }
            ))
            .textFieldStyle(.roundedBorder)
            
            if let error = store.errorMessage {
                Text(error)
                    .foregroundStyle(.red)
                    .font(.caption)
            }
            
            Button("Войти") {
                store.dispatch(.loginTapped)
            }
            .buttonStyle(.borderedProminent)
            .disabled(store.isLoading || store.login.isEmpty || store.password.isEmpty)
        }
        .padding()
    }
}
