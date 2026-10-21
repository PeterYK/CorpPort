//
//  MockNetwork.swift
//  CorpPortTests
//
//  Created by Peter Kozlov on 21.10.2026.
//

import Foundation
@testable import CorpPort

final class MockNetwork: NetworkService {
    var isValid: Bool
    init(isValid: Bool) { self.isValid = isValid }
    
    func validateToken(_ token: String) async throws -> Bool { isValid }
    
    // заглушки остальных методов
    func login(login: String, password: String) async throws -> String { "" }
    func fetchEmployees() async throws -> [EmployeeDTO] { [] }
    func fetchTeams() async throws -> [TeamDTO] { [] }
    func fetchWallPosts() async throws -> [WallPostDTO] { [] }
    func fetchInfoArticles() async throws -> [InfoArticleDTO] { [] }
    func fetchProjects() async throws -> [ProjectDTO] { [] }
    func fetchDayAllocation(for date: Date) async throws -> DayAllocationDTO? { nil }
    func saveDayAllocation(_ allocation: DayAllocationDTO) async throws {}
    func fetchUserProfile() async throws -> UserProfileDTO {
        UserProfileDTO(id: 0, name: "", position: "", teamId: nil, managerId: nil, city: nil, birthday: nil, email: nil, telegram: nil, favoriteProjectIds: nil, missedDates: nil)
    }
}
