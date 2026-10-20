//
//  EmployeeCell.swift
//  CorpPort
//
//  Created by Peter Kozlov on 15.10.2026.
//

import SwiftUI

struct EmployeeCell: View {
    let employee: Employee
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            // Аватар
            Circle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: 56, height: 56)
                .overlay {
                    Image(systemName: "person.fill")
                        .font(.title3)
                        .foregroundStyle(.gray)
                }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(employee.name)
                    .font(.headline)
                
                Text(employee.position)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                // Дополнительная информация (демо)
                HStack(spacing: 8) {
                    Text(employee.team?.name ?? " - ")
                    Text(employee.city ?? " - ")
                }
                .font(.caption)
                .foregroundStyle(.secondary)
                
                Text("ivan@company.com")
                    .font(.caption)
                    .foregroundStyle(.blue)
            }
            
            Spacer()
        }
        .padding(.vertical, 8)
    }
}
