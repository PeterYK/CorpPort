//
//  EmployeeStore.swift
//  CorpPort
//
//  Created by Peter Kozlov on 17.10.2026.
//

import Foundation

import SwiftUI

@Observable
final class EmployeeStore {
    private var router: AppRouter
    let employee: Employee
    private let tab: Tab
    
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
    
    init (employee: Employee, router: AppRouter, tab: Tab) {
        self.router = router
        self.employee = employee
        self.tab = tab
    }
    
    func dispatch(_ action: EmployeeActions) {
        switch action {
        case .employeeTapped(let employee):
            if tab == .employees {
                router.employeesPath.append(EmployeesRoute.employee(employee))
            } else {
                router.profilePath.append(ProfileRoute.employee(employee))
            }
        case .teamTapped:
            if let team = employee.team {
                if tab == .employees {
                    router.employeesPath.append(TeamsRoute.team(team))
                } else {
                    router.profilePath.append(ProfileRoute.employee(employee))
                }
            }
        case .emailTapped:
            if let email = employee.email {
                self.openMail(email)
            }
        }
    }
    
    private func openMail(_ email: String) {
        let cleaned = email.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let url = URL(string: "mailto:\(cleaned)") else { return }
        UIApplication.shared.open(url)
    }
    
}
