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
                
                SecureField("Пароль", text: Binding(
                    get: { store.password },
                    set: { store.dispatch(.passwordChanged($0)) }
                ))
                .textFieldStyle(.roundedBorder)
                
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
                    ProgressView()
                        .tint(.white)
                } else {
                    Text("Войти")
                        .frame(maxWidth: .infinity)
                }
            }
            .buttonStyle(.borderedProminent)
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
