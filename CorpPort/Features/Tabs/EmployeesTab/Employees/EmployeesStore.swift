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
    
    var searchText = ""
    
    var employees: [Employee] {
        dataService.employees
    }
    
    var filteredEmployees: [Employee] {
        guard !searchText.isEmpty else { return employees }
        
        let query = searchText.lowercased()
        
        return employees.filter { employee in
            employee.name.lowercased().contains(query) ||
            employee.position.lowercased().contains(query) ||
            (employee.city?.lowercased().contains(query) ?? false) ||
            (employee.email?.lowercased().contains(query) ?? false) ||
            (employee.team?.name.lowercased().contains(query) ?? false)
        }
    }
    
    init(router: AppRouter) {
        self.router = router
    }
    
    func dispatch(_ action: EmployeesActions) {
        switch action {
        case .employeeTapped(let employee):
            router.employeesPath.append(TeamsEmployeesRoute.employee(employee))
            
        case .searchTextChanged(let text):
            searchText = text
        }
    }
}
