//
//  MocNetworkService.swift
//  CorpPort
//
//  Created by Peter Kozlov on 17.10.2026.
//

import Foundation

final class MockNetworkService: NetworkService {
    func fetchEmployees() async throws -> [EmployeeDTO] {
        // имитация задержки сети
        try await Task.sleep(for: .milliseconds(300))
        return MockData.employees
    }
    
    func fetchTeams() async throws -> [TeamDTO] {
        try await Task.sleep(for: .milliseconds(300))
        return MockData.teams
    }
    
    func fetchWallPosts() async throws -> [WallPostDTO] {
        try await Task.sleep(for: .milliseconds(200))
        return MockData.wallPosts   // добавь в MockData
    }
    
    func fetchInfoArticles() async throws -> [InfoArticleDTO] {
        try await Task.sleep(for: .milliseconds(200))
        return MockData.infoArticles
    }
}
