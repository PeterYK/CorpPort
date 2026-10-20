//
//  EmployeeStore.swift
//  CorpPort
//
//  Created by Peter Kozlov on 17.10.2026.
//

import SwiftUI

@Observable
final class EmployeeStore {
    private var router: AppRouter
    let employee: Employee
    private let tab: TabType
    
    var isLeader: Bool {
        //        guard let team = employee.team else { return false }
        //        return team.leaders.contains { $0.id == employee.id }
        return employee.position == "Team Lead"
        
    }
    
    var subordinates: [Employee]? {
        guard isLeader, let team = employee.team else { return nil }
        //        // Все участники команды, кроме самого руководителя
        //        return team.members.filter { $0.id != employee.id }
        return team.members
    }
    
    init (employee: Employee, router: AppRouter, tab: TabType) {
        self.router = router
        self.employee = employee
        self.tab = tab
    }
    
    func dispatch(_ action: EmployeeActions) {
        switch action {
        case .employeeTapped(let employee):
            if tab == .employees {
                router.employeesPath.append(TeamsEmployeesRoute.employee(employee))
            } else if tab == .profile {
                router.profilePath.append(ProfileRoute.employee(employee))
            } else {
                router.wallPath.append(WallRoute.employee(employee))
            }
            
        case .teamTapped:
            if let team = employee.team {
                if tab == .employees {
                    router.employeesPath.append(TeamsEmployeesRoute.team(team))
                } else if tab == .profile{
                    router.profilePath.append(ProfileRoute.myTeam(team))
                } else {
                    router.wallPath.append(WallRoute.team(team))
                }
            }
            
        case .emailTapped:
            if let email = employee.email {
                openMail(email)
            }
            
        case .telegramTapped:
            if let tg = employee.tg {
                openTelegram(tg)
            }
        }
    }
}

extension EmployeeStore {
    private func openMail(_ email: String) {
        let cleaned = email.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let url = URL(string: "mailto:\(cleaned)") else { return }
        UIApplication.shared.open(url)
    }

    private func openTelegram(_ username: String) {
        let cleaned = username
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: "@", with: "")
        
        guard let url = URL(string: "https://t.me/\(cleaned)") else { return }
        UIApplication.shared.open(url)
    }
}
