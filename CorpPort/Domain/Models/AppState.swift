//
//  AppState.swift
//  CorpPort
//
//  Created by Peter Kozlov on 14.10.2026.
//

import SwiftUI

@Observable
class AppState {
    var isAuthenticated = false
//    var selectedTab: Tab = .wall
//    
//    var wallPath = NavigationPath()
//    var teamsPath = NavigationPath()
//    var employeesPath = NavigationPath()
//    var profilePath = NavigationPath()
//    var infoPath = NavigationPath()
}

enum Tab: Hashable {
    case wall
    case employees
    case profile
    case info
}

enum ProfileRoute: Hashable {
    case timeAllocation
    case myTeam(Team)
    case employee(Employee)
}

enum EmployeesRoute: Hashable {
    case employee(Employee)
}

enum TeamsRoute: Hashable {
    case team(Team)
}

enum InfoRoute: Hashable {
    case article(InfoArticle)
}

enum WallRoute: Hashable {
    case post(WallPost)
}
