//
//  LoginView.swift
//  CorpPort
//
//  Created by Peter Kozlov on 14.10.2026.
//

import SwiftUI

struct LoginView: View {
    @Environment(RootStore.self) var rootStore
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        let store = rootStore.loginStore
        
        VStack(spacing: 32) {
            Spacer()
            
            VStack(spacing: 12) {
                Image("AppLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundStyle(.brand)
                
                Text("Корпоративный портал")
                    .font(.title2.bold())
            }
            
            VStack(spacing: 16) {
                TextField("Логин", text: Binding(
                    get: { store.login },
                    set: { store.dispatch(.loginChanged($0)) }
                ))
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .disabled(store.isLoading)
                
                SecureField("Пароль", text: Binding(
                    get: { store.password },
                    set: { store.dispatch(.passwordChanged($0)) }
                ))
                .textFieldStyle(.roundedBorder)
                .disabled(store.isLoading)
                
                if let error = store.errorMessage {
                    Text(error)
                        .foregroundStyle(.red)
                        .font(.caption)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding(.horizontal, 32)
            
            Button {
                store.dispatch(.loginTapped)
            } label: {
                if store.isLoading {
                    LogoProgressView()
                        .frame(height: 24)
                } else {
                    Text("Войти")
                        .frame(maxWidth: .infinity)
                }
            }
            .buttonStyle(.borderedProminent)
            .foregroundStyle(colorScheme == .dark ? .black : .white)
            .tint(.brand)
            .disabled(store.isLoading || store.login.isEmpty || store.password.isEmpty)
            .padding(.horizontal, 32)
            
            Spacer()
            Spacer()
        }
        .safeAreaInset(edge: .bottom) {
            Text("Версия: \(store.appVersion)")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
        }
        
    }
}
