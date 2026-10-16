//
//  ContentView.swift
//  CorpPort
//
//  Created by Peter Kozlov on 13.10.2026.
//

import SwiftUI

// MARK: - Состояние приложения
//@Observable
//class AppState {
//    var isAuthenticated = false
//    var selectedTab: Tab = .home
//    
//    var homePath = NavigationPath()
//    var profilePath = NavigationPath()
//}
//
//enum Tab: Hashable {
//    case home
//    case profile
//}
//
//// MARK: - Роуты
//enum HomeRoute: Hashable {
//    case detail(id: Int)
//    case settings
//}
//
//enum ProfileRoute: Hashable {
//    case edit
//    case notifications
//}
//
//// MARK: - Корневой экран
//struct RootView: View {
//    @Environment(AppState.self) var appState
//
//    var body: some View {
//        if appState.isAuthenticated {
//            MainTabView()
//        } else {
//            LoginView()
//        }
//    }
//}
//
//// MARK: - Логин
//struct LoginView: View {
//    @Environment(AppState.self) var appState
//    
//    var body: some View {
//        @Bindable var appState = appState
//        VStack(spacing: 24) {
//            Text("Вход")
//                .font(.largeTitle.bold())
//            
//            Button("Войти") {
//                appState.isAuthenticated = true
//            }
//            .buttonStyle(.borderedProminent)
//        }
//        .padding()
//    }
//}
//
//// MARK: - Таббар
//struct MainTabView: View {
//    @Environment(AppState.self) var appState
//    
//    var body: some View {
//        @Bindable var appState = appState
//        
//        TabView(selection: $appState.selectedTab) {
//            // Home tab
//            NavigationStack(path: $appState.homePath) {
//                HomeView()
//                    .navigationDestination(for: HomeRoute.self) { route in
//                        switch route {
//                        case .detail(let id):
//                            Text("Детали #\(id)")
//                        case .settings:
//                            Text("Настройки Home")
//                        }
//                    }
//            }
//            .tabItem { Label("Wall", systemImage: "wallet.pass") }
//            .tag(Tab.home)
//            
//            // Profile tab
//            NavigationStack(path: $appState.profilePath) {
//                ProfileView()
//                    .navigationDestination(for: ProfileRoute.self) { route in
//                        switch route {
//                        case .edit:
//                            Text("Редактирование профиля")
//                        case .notifications:
//                            Text("Уведомления")
//                        }
//                    }
//            }
//            .tabItem { Label("Profile", systemImage: "person") }
//            .tag(Tab.profile)
//            // Profile tab
//            NavigationStack(path: $appState.profilePath) {
//                ProfileView()
//                    .navigationDestination(for: ProfileRoute.self) { route in
//                        switch route {
//                        case .edit:
//                            Text("Редактирование профиля")
//                        case .notifications:
//                            Text("Уведомления")
//                        }
//                    }
//            }
//            .tabItem { Label("Profile", systemImage: "person") }
//            .tag(Tab.profile)
//        }
//    }
//}
//
//// MARK: - Экраны
//struct HomeView: View {
//    @Environment(AppState.self) var appState
//    
//    var body: some View {
//        @Bindable var appState = appState
//        
//        VStack(spacing: 20) {
//            Text("Главная")
//                .font(.title)
//            
//            Button("Открыть детали") {
//                appState.homePath.append(HomeRoute.detail(id: 42))
//            }
//        }
//        .navigationTitle("Home")
//    }
//}
//
//struct ProfileView: View {
//    @Environment(AppState.self) var appState
//    
//    var body: some View {
//        @Bindable var appState = appState
//        
//        VStack(spacing: 20) {
//            Text("Профиль")
//                .font(.title)
//            
//            Button("Выйти") {
//                appState.isAuthenticated = false
//                appState.homePath = NavigationPath()
//                appState.profilePath = NavigationPath()
//            }
//        }
//        .navigationTitle("Profile")
//    }
//}
