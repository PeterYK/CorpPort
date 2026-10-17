//
//  MainTabView.swift
//  CorpPort
//
//  Created by Peter Kozlov on 14.10.2026.
//

import SwiftUI

struct MainTabView: View {
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
            .tag(Tab.wall)
            
            NavigationStack(path: $router.employeesPath) {
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
                            TeamView(team: team) { employee in
                                router.employeesPath.append(EmployeesRoute.employee(employee))
                            }
                        }
                    }
            }
            .tabItem { Label("Коллеги", systemImage: "person.3") }
            .tag(Tab.employees)
            
            NavigationStack(path: $router.profilePath) {
                ProfileView()
                    .navigationDestination(for: ProfileRoute.self) { route in
                        switch route {
                        case .timeAllocation:
                            TimeAllocationView()
                        case .myTeam(let team):
                            TeamView(team: team) { employee in
                                router.profilePath.append(ProfileRoute.employee(employee))
                            }
                        case .employee(let employee):
                            EmployeeView(employee: employee)
                        }
                    }
            }
            .tabItem { Label("Кабинет", systemImage: "person.circle") }
            .tag(Tab.profile)
            
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
            .tag(Tab.info)
        }
    }
}
