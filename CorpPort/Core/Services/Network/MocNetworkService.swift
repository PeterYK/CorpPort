//
//  MocNetworkService.swift
//  CorpPort
//
//  Created by Peter Kozlov on 17.10.2026.
//

import Foundation

final class MockNetworkService: NetworkService {
    func fetchUserProfile() async throws -> UserProfileDTO {
        try await Task.sleep(for: .milliseconds(300))
        return MockData.userProfile
    }
    
    func fetchEmployees() async throws -> [EmployeeDTO] {
        try await Task.sleep(for: .milliseconds(300))
        return MockData.employees
    }
    
    func fetchTeams() async throws -> [TeamDTO] {
        try await Task.sleep(for: .milliseconds(300))
        return MockData.teams
    }
    
    func fetchWallPosts() async throws -> [WallPostDTO] {
        try await Task.sleep(for: .milliseconds(200))
        return MockData.wallPosts 
    }
    
    func fetchInfoArticles() async throws -> [InfoArticleDTO] {
        try await Task.sleep(for: .milliseconds(200))
        return MockData.infoArticles
    }
    
    func fetchProjects() async throws -> [ProjectDTO] {
        try await Task.sleep(for: .milliseconds(200))
        return MockData.projects
    }
    
    func fetchDayAllocation(for date: Date) async throws -> DayAllocationDTO? {
        try await Task.sleep(for: .milliseconds(200))
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let key = formatter.string(from: date)
        return MockData.dayAllocations.first { $0.date == key }
    }

    func saveDayAllocation(_ allocation: DayAllocationDTO) async throws {
        try await Task.sleep(for: .milliseconds(300))
        print("Сохранено: \(allocation.date)")
    }
}
