//
//  ProjectsSectionView.swift
//  CorpPort
//
//  Created by Peter Kozlov on 19.10.2026.
//

import SwiftUI

struct ProjectsSectionView: View {
    let projects: [ProjectAllocation]
    let onHoursChange: (Int, Int) -> Void
    let onDelete: (Int) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Избранные проекты")
                .font(.headline)
                .padding(.horizontal)
            
            ForEach(projects) { project in
                HStack {
                    Text(project.project.name)
                    
                    Spacer()
                    
                    TextField("", value: Binding(
                        get: { project.hours },
                        set: { newValue in
                            onHoursChange(project.id, newValue)
                        }
                    ), format: .number)
                    .keyboardType(.numberPad)
                    .frame(width: 60)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.trailing)
                    .onTapGesture {
                        // фокус обрабатывается системой
                    }
                    
                    Text("%")
                        .foregroundStyle(.secondary)
                    
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
