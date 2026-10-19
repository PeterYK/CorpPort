//
//  MainTabView.swift
//  CorpPort
//
//  Created by Peter Kozlov on 14.10.2026.
//

import SwiftUI

struct MainTabView: View {
    @Environment(RootStore.self) var rootStore
    @Environment(AppRouter.self) var router
    
    var body: some View {
        @Bindable var router = router
        
        TabView(selection: $router.selectedTab) {
            NavigationStack(path: $router.wallPath) {
                WallView()
                    .navigationDestination(for: WallRoute.self) { route in
                        switch route {
                        case .post(let post):
                            WallPostView(post: post)
                        }
                    }
            }
            .tabItem { Label("Стена", systemImage: "newspaper") }
            .tag(TabType.wall)
            
            NavigationStack(path: $router.employeesPath) {
                TeamsEmployeesView()
                    .navigationDestination(for: TeamsEmployeesRoute.self) { route in
                        switch route {
                        case .employee(let employee):
                            EmployeeView(employee: employee, tab: .employees, rootStore: rootStore)
                        case .team(let team):
                            TeamView(team: team, tab: .employees, rootStore: rootStore)
                        }
                    }
            }
            .tabItem { Label("Сотрудники", systemImage: "person.3") }
            .tag(TabType.employees)
            
            NavigationStack(path: $router.profilePath) {
                ProfileView()
                    .navigationDestination(for: ProfileRoute.self) { route in
                        switch route {
                        case .timeAllocation:
                            TimeAllocationView()
                        case .myTeam(let team):
                            TeamView(team: team, tab: .profile, rootStore: rootStore)
                        case .employee(let employee):
                            EmployeeView(employee: employee, tab: .profile, rootStore: rootStore)
                        case .settings:
                            AppSettingsView()
                        }
                    }
            }
            .tabItem { Label("Кабинет", systemImage: "person.circle") }
            .tag(TabType.profile)
            .badge(rootStore.timeAllocationStore.missedCount)
            
            NavigationStack(path: $router.infoPath) {
                UsefulInfoView()
                    .navigationDestination(for: InfoRoute.self) { route in
                        switch route {
                        case .article(let article):
                            InfoArticleView(article: article)
                        }
                    }
            }
            .tabItem { Label("Инфо", systemImage: "info.circle") }
            .tag(TabType.info)
        }
        .tint(.brand)
        .task {
            rootStore.timeAllocationStore.loadFavoriteProjects()
        }
    }
}
