//
//  MockKeychain.swift
//  CorpPortTests
//
//  Created by Peter Kozlov on 21.10.2026.
//

import Foundation
@testable import CorpPort

final class MockKeychain: KeychainService {
    var token: String?
    var deleted = false
    
    init(token: String?) { self.token = token }
    
    func getToken() -> String? { token }
    func saveToken(_ token: String) {}
    func deleteToken() { deleted = true }
    func reset() { deleteToken() }
}
