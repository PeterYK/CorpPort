//
//  MainTabView.swift
//  CorpPort
//
//  Created by Peter Kozlov on 14.10.2026.
//

import SwiftUI

struct MainTabView: View {
    @Environment(AppState.self) var appState
    
    var body: some View {
        @Bindable var appState = appState
        
        TabView(selection: $appState.selectedTab) {
            NavigationStack(path: $appState.wallPath) {
                WallView()
                    .navigationDestination(for: WallRoute.self) { route in
                        switch route {
                        case .post(let post):
                            WallPostView(post: post)
                        }
                    }            }
            .tabItem { Label("Стена", systemImage: "newspaper") }
            .tag(Tab.wall)
            
            NavigationStack(path: $appState.employeesPath) {
                TeamsEmployeesView()
                    .navigationDestination(for: EmployeesRoute.self) { route in
                        switch route {
                        case .employee(let employee):
                            EmployeeView(employee: employee)
                        }
                    }
                    .navigationDestination(for: TeamsRoute.self) { route in
                        switch route {
                        case .team(let team):
                            TeamView(team: team)
                        }
                    }
            }
            .tabItem { Label("Коллеги", systemImage: "person.3") }
            .tag(Tab.employees)
            
            NavigationStack(path: $appState.infoPath) {
                UsefulInfoView()
                    .navigationDestination(for: InfoRoute.self) { route in
                        switch route {
                        case .article(let article):
                            InfoArticleView(article: article)
                        }
                    }            }
            .tabItem { Label("Инфо", systemImage: "info.circle") }
            .tag(Tab.info)
            
            NavigationStack(path: $appState.profilePath) {
                ProfileView()
                    .navigationDestination(for: ProfileRoute.self) { route in
                        switch route {
                        case .timeAllocation:
                            TimeAllocationView()
                        case .myTeam(let team):
                            TeamView(team: team)
                        case .employee(let employee):
                            EmployeeView(employee: employee)
                        }
                    }
            }
            .tabItem { Label("Кабинет", systemImage: "person.circle") }
            .tag(Tab.profile)
            .badge(3)
            
        }
    }
}
