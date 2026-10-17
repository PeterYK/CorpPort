//
//  EmployeesView.swift
//  CorpPort
//
//  Created by Peter Kozlov on 14.10.2026.
//

import SwiftUI

struct EmployeesView: View {
    @Environment(AppRouter.self) var router

    private let employees = [
        Employee(name: "Иван Иванов", position: "iOS-разработчик"),
        Employee(name: "Мария Петрова", position: "Дизайнер"),
        Employee(name: "Алексей Смирнов", position: "Team Lead"),
        Employee(name: "Ольга Кузнецова", position: "Backend-разработчик")
    ]
    
    var body: some View {        
        List(employees) { employee in
            Button {
                router.employeesPath.append(EmployeesRoute.employee(employee))
            } label: {
                EmployeeCell(employee: employee)
            }
            .buttonStyle(.plain)
        }
        .listStyle(.plain)
    }
}
