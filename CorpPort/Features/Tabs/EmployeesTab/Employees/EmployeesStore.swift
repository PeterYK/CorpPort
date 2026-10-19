//
//  EmployeesStore.swift
//  CorpPort
//
//  Created by Peter Kozlov on 17.10.2026.
//

import SwiftUI

@Observable
final class EmployeesStore {
    @ObservationIgnored private var dataService: DataService = ServiceLocator.shared.getService()

    private var router: AppRouter
    
    var employees: [Employee] {
        dataService.employees
    }
        
    init (router: AppRouter) {
        self.router = router
    }
    
    func dispatch(_ action: EmployeesActions) {
        switch action {
        case .employeeTapped(let employee):
            router.employeesPath.append(TeamsEmployeesRoute.employee(employee))
        }
    }
}
