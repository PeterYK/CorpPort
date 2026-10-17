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
        if isDebug {
            serviceLocator.addService(NetworkService.self, service: MocNetworkService())
        } else {
            serviceLocator.addService(NetworkService.self, service: AppNetworkService())
        }
        
        serviceLocator.addService(KeychainService.self, service: AppKeychainService())
        serviceLocator.addService(DataService.self, service: AppDataService())
    }
}
