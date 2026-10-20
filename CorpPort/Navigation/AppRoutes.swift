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

enum WallRoute: Hashable {
    case post(WallPost)
    case info
    case article(InfoArticle)
    case employee(Employee)
    case team(Team)
}
