//
//  AppKeychainService.swift
//  CorpPort
//
//  Created by Peter Kozlov on 17.10.2026.
//

import Foundation
import KeychainAccess


enum KeychainKey: String {
    case authToken = "auth_token"
}

final class AppKeychainService: KeychainService {
    private let keychain = Keychain(service: "com.corpapp.otusfinalproject")
    
    func saveToken(_ token: String) {
        keychain[KeychainKey.authToken.rawValue] = token
    }
    
    func getToken() -> String? {
        keychain[KeychainKey.authToken.rawValue]
    }
    
    func deleteToken() {
        try? keychain.remove(KeychainKey.authToken.rawValue)
    }
    
    func reset() {
        deleteToken()
    }
}
