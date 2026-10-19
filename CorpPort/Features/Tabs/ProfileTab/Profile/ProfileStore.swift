//
//  ProfileStore.swift
//  CorpPort
//
//  Created by Peter Kozlov on 17.10.2026.
//

import SwiftUI

@Observable
final class ProfileStore {
    private var dataService: DataService

    private var router: AppRouter
    private var appState: AppState
    
    var userProfile: UserProfile? {
        dataService.userProfile
    }
    
    var missedCount: Int {
        dataService.userProfile?.missedDates.count ?? 0
    }
    
    init (router: AppRouter, appState: AppState, dataService: DataService) {
        self.dataService = dataService
        self.router = router
        self.appState = appState
    }
    
    func dispatch(_ action: ProfileActions) {
        switch action {
        case .employeeTapped:
            if let manager = userProfile?.manager {
                router.profilePath.append(ProfileRoute.employee(manager))
            }
        case .teamTapped:
            if let team = userProfile?.team {
                router.profilePath.append(ProfileRoute.myTeam(team))
            }
        case .timeAllocationTapped:
            router.profilePath.append(ProfileRoute.timeAllocation)
        case .logoutTapped:
            appState.isAuthenticated = false
            router.resetAllPaths()
        }
    }
    
}
