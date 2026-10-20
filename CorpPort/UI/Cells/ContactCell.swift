//
//  ContactCell.swift
//  CorpPort
//
//  Created by Peter Kozlov on 20.10.2026.
//

import SwiftUI

struct ContactCell: View {
    let employee: Employee
    
    var body: some View {
        VStack(spacing: 8) {
            Circle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: 64, height: 64)
                .overlay {
                    Image(systemName: "person.fill")
                        .font(.title2)
                        .foregroundStyle(.brand)
                }
            
            Text(employee.name)
                .font(.caption)
                .multilineTextAlignment(.center)
                .lineLimit(2)
            
            Text(employee.position)
                .font(.caption2)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .lineLimit(2)
        }
        .frame(width: 100)
    }
}
