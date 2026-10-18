//
//  RootStore.swift
//  CorpPort
//
//  Created by Peter Kozlov on 17.10.2026.
//

import Foundation

@Observable
final class RootStore {
    let loginStore: LoginStore
    let wallStore: WallStore
    let infoStore: UsefulInfoStore
    let teamsStore: TeamsStore
    let employeesStore: EmployeesStore
    
    private let router: AppRouter

    init(appState: AppState, router: AppRouter) {
        self.router = router
        self.loginStore = LoginStore(appState: appState)
        self.wallStore = WallStore(router: router)
        self.infoStore = UsefulInfoStore(router: router)
        self.teamsStore = TeamsStore(router: router)
        self.employeesStore = EmployeesStore(router: router)
    }
    
    func makeTeamStore(team: Team, tab: Tab) -> TeamStore {
        return TeamStore(team: team, router: router, tab: tab)
    }
}
