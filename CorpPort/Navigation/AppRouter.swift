//
//  AppRouter.swift
//  CorpPort
//
//  Created by Peter Kozlov on 17.10.2026.
//

import SwiftUI

@Observable
final class AppRouter {
    var selectedTab: Tab = .wall
    
    var wallPath = NavigationPath()
    var employeesPath = NavigationPath()
    var profilePath = NavigationPath()
    var infoPath = NavigationPath()
    
    func resetAllPaths() {
        selectedTab = .wall
        wallPath = NavigationPath()
        employeesPath = NavigationPath()
        profilePath = NavigationPath()
        infoPath = NavigationPath()
    }
}
