//
//  EmployeeRow.swift
//  CorpPort
//
//  Created by Peter Kozlov on 16.10.2026.
//

import SwiftUI

struct EmployeeRow: View {
    let employee: Employee
    
    var body: some View {
        HStack(spacing: 12) {
            Circle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: 44, height: 44)
                .overlay {
                    Image(systemName: "person.fill")
                        .foregroundStyle(.gray)
                }
            
            VStack(alignment: .leading, spacing: 2) {
                Text(employee.name)
                    .font(.body.weight(.medium))
                Text(employee.position)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
    }
}
