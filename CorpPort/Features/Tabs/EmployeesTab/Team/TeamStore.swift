//
//  TeamStore.swift
//  CorpPort
//
//  Created by Peter Kozlov on 17.10.2026.
//

import SwiftUI

@Observable
final class TeamStore {
    private var router: AppRouter
    let team: Team
    private let tab: TabType
    
    init (team: Team, router: AppRouter, tab: TabType) {
        self.router = router
        self.team = team
        self.tab = tab
    }
    
    func dispatch(_ action: TeamActions) {
        switch action {
        case .employeeTapped(let employee):
            if tab == .employees {
                router.employeesPath.append(TeamsEmployeesRoute.employee(employee))
            } else if tab == .profile {
                router.profilePath.append(ProfileRoute.employee(employee))
            } else {
                router.wallPath.append(WallRoute.employee(employee))
            }
        }
    }
    
}
