//
//  AppRoutes.swift
//  CorpPort
//
//  Created by Peter Kozlov on 18.10.2026.
//

import Foundation

enum TabType: Hashable {
    case wall
    case employees
    case profile
    case info
}

enum ProfileRoute: Hashable {
    case timeAllocation
    case myTeam(Team)
    case employee(Employee)
    case settings
}

enum TeamsEmployeesRoute: Hashable {
    case employee(Employee)
    case team(Team)
}

enum InfoRoute: Hashable {
    case article(InfoArticle)
}

enum WallRoute: Hashable {
    case post(WallPost)
}
