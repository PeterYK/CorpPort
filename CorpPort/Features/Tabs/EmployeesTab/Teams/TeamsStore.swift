//
//  TeamsStore.swift
//  CorpPort
//
//  Created by Peter Kozlov on 17.10.2026.
//

import SwiftUI

@Observable
final class TeamsStore {
    @ObservationIgnored private var dataService: DataService = ServiceLocator.shared.getService()
    
    private var router: AppRouter
    
    var teams: [Team] {
        dataService.teams
    }
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    init (router: AppRouter) {
        self.router = router
    }
    
    func dispatch(_ action: TeamsActions) {
        switch action {
        case .teamTapped(let team):
            router.employeesPath.append(TeamsEmployeesRoute.team(team))
        }
    }
    
}
