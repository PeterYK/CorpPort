//
//  TeamsEmployeesView.swift
//  CorpPort
//
//  Created by Peter Kozlov on 15.10.2026.
//

import SwiftUI

enum EmployeesType: String, CaseIterable {
    case teams = "Команды"
    case employees = "Сотрудники"
}

struct TeamsEmployeesView: View {
    @State private var selectedType: EmployeesType = .teams
    
    var body: some View {
        VStack {
            Picker("Фильтр", selection: $selectedType) {
                ForEach(EmployeesType.allCases, id: \.self) { type in
                    Text(type.rawValue).tag(type)
                }
            }
            .pickerStyle(.segmented)
            .tint(.brand)
            .padding()
            
            switch selectedType {
            case .employees:
                EmployeesView()
            case .teams:
                TeamsView()
            }
        }
        .navigationTitle("Сотрудники")
        .withAppLogo()
    }
}
