//
//  AddProjectSheet.swift
//  CorpPort
//
//  Created by Peter Kozlov on 15.10.2026.
//

import SwiftUI

// MARK: - Модальное окно добавления проекта
struct AddProjectSheet: View {
    let availableProjects: [String]
    let onSelect: (String) -> Void
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            List(availableProjects, id: \.self) { project in
                Button(project) {
                    onSelect(project)
                    dismiss()
                }
            }
            .navigationTitle("Добавить проект")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Закрыть") { dismiss() }
                }
            }
        }
    }
}
