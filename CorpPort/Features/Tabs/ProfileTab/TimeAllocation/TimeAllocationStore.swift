//
//  TimeAllocationStore.swift
//  CorpPort
//
//  Created by Peter Kozlov on 17.10.2026.
//

import Foundation

@Observable
final class TimeAllocationStore {
    var selectedDate = Date()
    var currentMonth = Date()
    var showAddProject = false
    
    var favoriteProjects: [ProjectAllocation] = [
        ProjectAllocation(name: "Мобильное приложение", hours: 40),
        ProjectAllocation(name: "Внутренний портал", hours: 30)
    ]
    
    let allProjects = [
        "Мобильное приложение",
        "Внутренний портал",
        "Аналитика",
        "Инфраструктура",
        "Поддержка"
    ]
    
    var availableProjects: [String] {
        allProjects.filter { name in
            !favoriteProjects.contains { $0.name == name }
        }
    }
    
    func dispatch(_ action: TimeAllocationActions) {
        switch action {
        case .selectDate(let date):
            selectedDate = date
            
        case .changeMonth(let value):
            if let newMonth = Calendar.current.date(byAdding: .month, value: value, to: currentMonth) {
                currentMonth = newMonth
            }
            
        case .changeSelectedDate(let value):
            if let newDate = Calendar.current.date(byAdding: .day, value: value, to: selectedDate) {
                selectedDate = newDate
                currentMonth = newDate
            }
            
        case .addProject(let name):
            favoriteProjects.append(ProjectAllocation(name: name, hours: 0))
            showAddProject = false
            
        case .deleteProject(let id):
                favoriteProjects.removeAll { $0.id == id }
            
        case .updateHours(let id, let hours):
            if let index = favoriteProjects.firstIndex(where: { $0.id == id }) {
                favoriteProjects[index].hours = hours
            }
            
        case .showAddProject:
            showAddProject = true
            
        case .hideAddProject:
            showAddProject = false
        }
    }
}
