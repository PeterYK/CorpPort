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
    private let tab: Tab
    
    init (team: Team, router: AppRouter, tab: Tab) {
        self.router = router
        self.team = team
        self.tab = tab
    }
    
    func dispatch(_ action: TeamActions) {
        switch action {
        case .employeeTapped(let employee):
            if tab == .employees {
                router.employeesPath.append(EmployeesRoute.employee(employee))
            } else {
                router.profilePath.append(ProfileRoute.employee(employee))
            }
        }
    }
    
}
