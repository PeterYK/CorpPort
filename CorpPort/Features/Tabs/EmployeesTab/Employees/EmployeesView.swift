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
        VStack(spacing: 0) {
            searchView()

            List(rootStore.employeesStore.filteredEmployees) { employee in
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
}

extension EmployeesView {
    private func searchView() -> some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.secondary)
            
            TextField("Поиск", text: Binding(
                get: { rootStore.employeesStore.searchText },
                set: { rootStore.employeesStore.dispatch(.searchTextChanged($0)) }
            ))
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
        }
        .padding(10)
        .background(Color.gray.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}
