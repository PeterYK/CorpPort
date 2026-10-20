//
//  TimeAllocationView.swift
//  CorpPort
//
//  Created by Peter Kozlov on 15.10.2026.
//

import SwiftUI

struct TimeAllocationView: View {
    @Environment(RootStore.self) var rootStore
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        @Bindable var store = rootStore.timeAllocationStore
        
        ScrollView {
            VStack(spacing: 20) {
                MonthCalendarView(
                    store: store,
                    currentMonth: store.currentMonth,
                    selectedDate: store.selectedDate,
                    onMonthChange: { value in
                        store.dispatch(.changeMonth(value))
                    },
                    onDateSelect: { date in
                        store.dispatch(.selectDate(date))
                    }
                )
                
                SelectedDateControl(
                    selectedDate: store.selectedDate,
                    onChange: { value in
                        store.dispatch(.changeSelectedDate(value))
                    }
                )
                
                ProjectsSectionView(
                    projects: store.favoriteProjects,
                        onHoursChange: { id, hours in
                            store.dispatch(.updateHours(projectId: id, hours: hours))
                        },
                        onDelete: { id in
                            store.dispatch(.deleteProject(id))
                        }
                )
                
                Button {
                    store.dispatch(.showAddProject)
                } label: {
                    Label("Добавить проект", systemImage: "plus")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .foregroundStyle(colorScheme == .dark ? .black : .white)
                .padding(.horizontal)
                
                Button {
                    store.dispatch(.save)
                } label: {
                    if store.isSaving {
                        ProgressView()
                    } else {
                        Text("Сохранить")
                            .frame(maxWidth: .infinity)
                    }
                }
                .buttonStyle(.borderedProminent)
                .foregroundStyle(colorScheme == .dark ? .black : .white)
                .disabled(store.isSaving)
                .padding(.horizontal)
            }
            .padding(.vertical)
        }
        .navigationTitle("Трудозатраты")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $store.showAddProject) {
            AddProjectSheet(
                availableProjects: store.availableProjects,
                onSelect: { project in
                    store.dispatch(.addProject(project))
                }
            )
        }
        .task {
            store.dispatch(.selectDate(store.selectedDate))
        }
    }
}
