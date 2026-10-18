//
//  AppNetworkService.swift
//  CorpPort
//
//  Created by Peter Kozlov on 17.10.2026.
//

import Foundation

final class AppNetworkService: NetworkService {
    func fetchEmployees() async throws -> [EmployeeDTO] {
        return []
    }
    
    func fetchTeams() async throws -> [TeamDTO] {
        return []
    }
    
    func fetchWallPosts() async throws -> [WallPostDTO] {
        return []
    }
    
    func fetchInfoArticles() async throws -> [InfoArticleDTO] {
        return []
    }
    
    public init() {}
}
