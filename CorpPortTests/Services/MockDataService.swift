//
//  MockDataService.swift
//  CorpPortTests
//
//  Created by Peter Kozlov on 21.10.2026.
//

import Foundation
@testable import CorpPort

final class MockDataService: DataService {
    var loadCalled = false
    
    func loadAllData() async throws { loadCalled = true }
    
    // остальные свойства — заглушки
    var employees: [Employee] { [] }
    var teams: [Team] { [] }
    var wallPosts: [WallPost] { [] }
    var infoArticles: [InfoArticle] { [] }
    var projects: [Project] { [] }
    var userProfile: UserProfile? { nil }
    
    func reset() {}
}
