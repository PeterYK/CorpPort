//
//  CorpPortApp.swift
//  CorpPort
//
//  Created by Peter Kozlov on 13.10.2026.
//

import SwiftUI
//import SwiftData

@main
struct CorporatePortalApp: App {
    private let configurator = Configurator()
    @State private var appState: AppState
    @State private var appRouter: AppRouter
    @State private var rootStore: RootStore
    
    init() {
        Thread.sleep(forTimeInterval: 2.0)   // TODO: - задержка для отображения LaumchScreen

        let appState = AppState()
        let appRouter = AppRouter()
        
        _appRouter = State(initialValue: appRouter)
        _appState = State(initialValue: appState)
        _rootStore = State(initialValue: RootStore(appState: appState, router: appRouter))
        
        setupNotificationHandling(router: appRouter)
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(appRouter)
                .environment(appState)
                .environment(rootStore)
        }
    }
    
    private func setupNotificationHandling(router: AppRouter) {
        var notificationService: NotificationService = ServiceLocator.shared.getService()
        notificationService.onTRZNotificationTapped = { [weak router] in
            router?.openTimeAllocations()
        }
//        } else {
//            print("notificationService is nil")
//        }
    }
}
