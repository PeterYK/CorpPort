//
//  EmployeesStore.swift
//  CorpPort
//
//  Created by Peter Kozlov on 17.10.2026.
//

import SwiftUI

@Observable
final class EmployeesStore {
    private var router: AppRouter

    let employees = [
        Employee(name: "Иван Иванов", position: "iOS-разработчик"),
        Employee(name: "Мария Петрова", position: "Дизайнер"),
        Employee(name: "Алексей Смирнов", position: "Team Lead"),
        Employee(name: "Ольга Кузнецова", position: "Backend-разработчик")
    ]
        
    init (router: AppRouter) {
        self.router = router
    }
    
    func dispatch(_ action: EmployeesActions) {
        switch action {
        case .employeeTapped(let employee):
            router.employeesPath.append(EmployeesRoute.employee(employee))
        }
    }
    
}
