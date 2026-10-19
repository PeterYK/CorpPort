//
//  ProjectsSectionView.swift
//  CorpPort
//
//  Created by Peter Kozlov on 19.10.2026.
//

import SwiftUI

struct ProjectsSectionView: View {
    let projects: [ProjectAllocation]
    let onHoursChange: (UUID, Int) -> Void
    let onDelete: (UUID) -> Void          // ← новое
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Избранные проекты")
                .font(.headline)
                .padding(.horizontal)
            
            ForEach(projects) { project in
                HStack {
                    Text(project.name)
                    
                    Spacer()
                    
                    TextField("0", value: Binding(
                        get: { project.hours },
                        set: { onHoursChange(project.id, $0) }
                    ), format: .number)
                    .keyboardType(.numberPad)
                    .frame(width: 60)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.trailing)
                    
                    Text("%")
                        .foregroundStyle(.secondary)
                    
                    // Кнопка удаления
                    Button {
                        onDelete(project.id)
                    } label: {
                        Image(systemName: "trash")
                            .foregroundStyle(.red)
                    }
                    .buttonStyle(.plain)
                }
                .padding(.horizontal)
            }
        }
    }
}
