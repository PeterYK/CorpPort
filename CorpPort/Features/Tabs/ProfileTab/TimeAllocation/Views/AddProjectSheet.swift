//
//  AddProjectSheet.swift
//  CorpPort
//
//  Created by Peter Kozlov on 15.10.2026.
//

import SwiftUI

struct AddProjectSheet: View {
    let availableProjects: [Project]
    let onSelect: (Project) -> Void
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            List(availableProjects) { project in
                Button(project.name) {
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
