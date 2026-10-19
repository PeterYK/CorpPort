//
//  ProfileStore.swift
//  CorpPort
//
//  Created by Peter Kozlov on 17.10.2026.
//

import SwiftUI

@Observable
final class ProfileStore {
    private var dataService: DataService = ServiceLocator.shared.getService()

    private var router: AppRouter
    private var appState: AppState
    
    var userProfile: UserProfile? {
        dataService.userProfile
    }
    
    init (router: AppRouter, appState: AppState) {
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
