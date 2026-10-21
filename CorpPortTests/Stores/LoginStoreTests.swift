//
//  LoginStoreTests.swift
//  CorpPortTests
//
//  Created by Peter Kozlov on 21.10.2026.
//

import Foundation
import XCTest
@testable import CorpPort 

@MainActor
final class LoginStoreTests: XCTestCase {
    
    func test_tryAutoLogin_validToken_authenticates() async {
        let keychain = MockKeychain(token: "valid")
        let network = MockNetwork(isValid: true)
        let dataService = MockDataService()
        let appState = AppState()
        
        let store = LoginStore(
            appState: appState,
            networkService: network,
            keychainService: keychain,
            dataService: dataService
        )
        
        await store.tryAutoLogin()
        
        XCTAssertTrue(appState.isAuthenticated)
        XCTAssertTrue(dataService.loadCalled)
        XCTAssertFalse(keychain.deleted)
    }
    
    func test_tryAutoLogin_invalidToken_doesNotAuthenticate() async {
        let keychain = MockKeychain(token: "bad")
        let network = MockNetwork(isValid: false)
        let dataService = MockDataService()
        let appState = AppState()
        
        let store = LoginStore(
            appState: appState,
            networkService: network,
            keychainService: keychain,
            dataService: dataService
        )
        
        await store.tryAutoLogin()
        
        XCTAssertFalse(appState.isAuthenticated)
        XCTAssertTrue(keychain.deleted)
        XCTAssertFalse(dataService.loadCalled)
    }
    
    func test_tryAutoLogin_nilToken_authenticates() async {
        let keychain = MockKeychain(token: nil)
        let network = MockNetwork(isValid: false)
        let dataService = MockDataService()
        let appState = AppState()
        
        let store = LoginStore(
            appState: appState,
            networkService: network,
            keychainService: keychain,
            dataService: dataService
        )
        
        await store.tryAutoLogin()
        
        XCTAssertFalse(appState.isAuthenticated)
        XCTAssertFalse(keychain.deleted)
        XCTAssertFalse(dataService.loadCalled)
    }

}
