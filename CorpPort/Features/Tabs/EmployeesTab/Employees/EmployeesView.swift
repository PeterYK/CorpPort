//
//  EmployeesView.swift
//  CorpPort
//
//  Created by Peter Kozlov on 14.10.2026.
//

import SwiftUI

struct EmployeesView: View {
    @Environment(RootStore.self) var rootStore
    
    var body: some View {        
        List(rootStore.employeesStore.employees) { employee in
            Button {
                rootStore.employeesStore.dispatch(.employeeTapped(employee))
            } label: {
                EmployeeCell(employee: employee)
            }
            .buttonStyle(.plain)
        }
        .listStyle(.plain)
    }
}
