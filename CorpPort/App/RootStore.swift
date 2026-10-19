//
//  RootStore.swift
//  CorpPort
//
//  Created by Peter Kozlov on 17.10.2026.
//

import Foundation

@Observable
final class RootStore {
    @ObservationIgnored private var dataService: DataService = ServiceLocator.shared.getService()
    @ObservationIgnored private var networkService: NetworkService = ServiceLocator.shared.getService()

    let loginStore: LoginStore
    let wallStore: WallStore
    let infoStore: UsefulInfoStore
    let teamsStore: TeamsStore
    let employeesStore: EmployeesStore
    let profileStore: ProfileStore
    let timeAllocationStore: TimeAllocationStore

    // в init
    private let router: AppRouter

    init(appState: AppState, router: AppRouter) {
        self.router = router
        self.loginStore = LoginStore(appState: appState)
        self.wallStore = WallStore(router: router)
        self.infoStore = UsefulInfoStore(router: router)
        self.teamsStore = TeamsStore(router: router)
        self.employeesStore = EmployeesStore(router: router)
        self.profileStore = ProfileStore(router: router, appState: appState, dataService: dataService)
        self.timeAllocationStore = TimeAllocationStore(dataService: dataService, networkService: networkService)
    }
    
    func makeTeamStore(team: Team, tab: TabType) -> TeamStore {
        return TeamStore(team: team, router: router, tab: tab)
    }
    
    func makeEmployeeStore(employee: Employee, tab: TabType) -> EmployeeStore {
        return EmployeeStore(employee: employee, router: router, tab: tab)
    }
}
