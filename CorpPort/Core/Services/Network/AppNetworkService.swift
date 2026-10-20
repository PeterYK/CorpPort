//
//  AppNetworkService.swift
//  CorpPort
//
//  Created by Peter Kozlov on 17.10.2026.
//

import Foundation

final class AppNetworkService: NetworkService {
    
    public init() {}

    func fetchUserProfile() async throws -> UserProfileDTO {
        return MockData.userProfile
    }
    
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
    
    func fetchProjects() async throws -> [ProjectDTO] {
        return []
    }
    
    func fetchDayAllocation(for date: Date) async throws -> DayAllocationDTO? {
        return nil
    }

    func saveDayAllocation(_ allocation: DayAllocationDTO) async throws {}
    
    func login(login: String, password: String) async throws -> String {
        throw URLError(.unknown)
    }

    func validateToken(_ token: String) async throws -> Bool {
        throw URLError(.unknown)
    }
}
