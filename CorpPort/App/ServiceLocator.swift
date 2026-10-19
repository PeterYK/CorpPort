//
//  ServiceLocator.swift
//  CorpPort
//
//  Created by Peter Kozlov on 17.10.2026.
//

import Foundation

final class ServiceLocator {
    static let shared = ServiceLocator()
    private init() {}
    
    private var services: [ObjectIdentifier: Any] = [:]
    
    func addService<T>(_ type: T.Type, service: T) {
        services[ObjectIdentifier(type)] = service
    }
    
    func getService<T>(_ type: T.Type = T.self) -> T {
        guard let service = services[ObjectIdentifier(type)] as? T else {
            preconditionFailure("Service not registered: \(type)")
        }
        return service
    }
}
