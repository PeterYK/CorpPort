//
//  AppRouter.swift
//  CorpPort
//
//  Created by Peter Kozlov on 17.10.2026.
//

import SwiftUI

@Observable
final class AppRouter {
    var selectedTab: TabType = .wall
    
    var wallPath = NavigationPath()
    var employeesPath = NavigationPath()
    var profilePath = NavigationPath()
    
    func resetAllPaths() {
        selectedTab = .wall
        wallPath = NavigationPath()
        employeesPath = NavigationPath()
        profilePath = NavigationPath()
    }
    
    func openTimeAllocations() {
        selectedTab = .profile
        profilePath = NavigationPath()
        profilePath.append(ProfileRoute.timeAllocation)
    }
}
