//
//  Configurator.swift
//  CorpPort
//
//  Created by Peter Kozlov on 17.10.2026.
//

import Foundation

class Configurator {
    private let serviceLocator = ServiceLocator.shared
    private let isDebug: Bool = true

    init () {
        self.setup()
    }
    
    func setup() {
        registerServices()
    }
    
    private func registerServices() {
        let networkService: NetworkService = isDebug
        ? MockNetworkService()
        : AppNetworkService()
        
        serviceLocator.addService(NetworkService.self, service: networkService)
        serviceLocator.addService(KeychainService.self, service: AppKeychainService())
        
        let dataService = AppDataService(networkService: networkService)
        serviceLocator.addService(DataService.self, service: dataService)
        serviceLocator.addService(NotificationService.self, service: AppNotificationService())
    }
}
