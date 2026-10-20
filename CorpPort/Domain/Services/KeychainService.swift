//
//  KeychainService.swift
//  CorpPort
//
//  Created by Peter Kozlov on 17.10.2026.
//

import Foundation

protocol KeychainService {
    func saveToken(_ token: String)
    func getToken() -> String?
    func deleteToken()
    func reset()
}
