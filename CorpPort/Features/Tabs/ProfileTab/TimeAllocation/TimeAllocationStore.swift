//
//  TimeAllocationStore.swift
//  CorpPort
//
//  Created by Peter Kozlov on 17.10.2026.
//

import Foundation

@Observable
final class TimeAllocationStore {
    private let dataService: DataService
    private let networkService: NetworkService
    
    var selectedDate = Date()
    var currentMonth = Date()
    var showAddProject = false
    var favoriteProjects: [ProjectAllocation] = []
    var isSaving = false
    
    var availableProjects: [Project] {
        dataService.projects.filter { project in
            !favoriteProjects.contains { $0.project.id == project.id }
        }
    }
    
    var missedCount: Int = 0
    
    init(dataService: DataService, networkService: NetworkService) {
        self.dataService = dataService
        self.networkService = networkService
        
        if let profile = dataService.userProfile {
            favoriteProjects = profile.favoriteProjects.map {
                ProjectAllocation(project: $0, hours: 0)
            }
        }
        updateMissedCount()
    }
    
    func dispatch(_ action: TimeAllocationActions) {
        switch action {
        case .selectDate(let date):
            selectedDate = date
            Task { await loadAllocation(for: date) }
            
        case .changeMonth(let value):
            if let newMonth = Calendar.current.date(byAdding: .month, value: value, to: currentMonth) {
                currentMonth = newMonth
            }
        case .changeSelectedDate(let value):
            if let newDate = Calendar.current.date(byAdding: .day, value: value, to: selectedDate) {
                selectedDate = newDate
                currentMonth = newDate
                Task { await loadAllocation(for: newDate) }
            }
        case .showAddProject:
            showAddProject = true
            
        case .hideAddProject:
            showAddProject = false
            
        case .save:
            Task { await saveCurrentDay() }
            
        case .addProject(let project):
            favoriteProjects.append(ProjectAllocation(project: project, hours: 0))
            showAddProject = false
            
        case .deleteProject(let id):
            favoriteProjects.removeAll { $0.id == id }
            
        case .updateHours(let id, let hours):
            if let index = favoriteProjects.firstIndex(where: { $0.id == id }) {
                favoriteProjects[index].hours = hours
            }
        }
    }
    
    func reset() {
        selectedDate = Date()
        currentMonth = Date()
        favoriteProjects = []
        missedCount = 0
        showAddProject = false
        isSaving = false
    }
}

extension TimeAllocationStore {
    func loadFavoriteProjects() {
        guard let profile = dataService.userProfile else { return }
        if favoriteProjects.isEmpty {
            favoriteProjects = profile.favoriteProjects.map {
                ProjectAllocation(project: $0, hours: 0)
            }
        }
        updateMissedCount()
    }
    
    private func loadAllocation(for date: Date) async {
        do {
            let dto = try await networkService.fetchDayAllocation(for: date)
            
            await MainActor.run {
                // Сначала обнуляем все проекты
                for index in favoriteProjects.indices {
                    favoriteProjects[index].hours = 0
                }
                
                // Потом проставляем пришедшие значения
                if let dto {
                    for alloc in dto.allocations {
                        if let index = favoriteProjects.firstIndex(where: { $0.project.id == alloc.projectId }) {
                            favoriteProjects[index].hours = alloc.hours
                        }
                    }
                }
            }
        } catch {
            print("Ошибка загрузки: \(error)")
            // При ошибке тоже обнуляем
            await MainActor.run {
                for index in favoriteProjects.indices {
                    favoriteProjects[index].hours = 0
                }
            }
        }
    }
    
    func isMissed(_ date: Date) -> Bool {
        let calendar = Calendar.current
        return dataService.userProfile?.missedDates.contains {
            calendar.isDate($0, inSameDayAs: date)
        } ?? false
    }
    
    private func saveCurrentDay() async {
        isSaving = true
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let dto = DayAllocationDTO(
            date: formatter.string(from: selectedDate),
            allocations: favoriteProjects.map {
                AllocationDTO(projectId: $0.project.id, hours: $0.hours)
            }
        )
        
        do {
            try await networkService.saveDayAllocation(dto)
            await MainActor.run { isSaving = false }
        } catch {
            await MainActor.run { isSaving = false }
        }
        
        await MainActor.run {
            dataService.userProfile?.favoriteProjects = favoriteProjects.map { $0.project }
        }
        
        await MainActor.run {
            dataService.userProfile?.missedDates.removeAll {
                Calendar.current.isDate($0, inSameDayAs: selectedDate)
            }
        }
        
        updateMissedCount()
    }
    
    private func updateMissedCount() {
            missedCount = dataService.userProfile?.missedDates.count ?? 0
        }
}
