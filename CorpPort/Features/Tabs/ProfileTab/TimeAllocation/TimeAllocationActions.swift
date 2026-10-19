//
//  TimeAllocationActions.swift
//  CorpPort
//
//  Created by Peter Kozlov on 17.10.2026.
//

import Foundation

enum TimeAllocationActions {
    case selectDate(Date)
    case changeMonth(Int)
    case changeSelectedDate(Int)
    case addProject(String)
    case deleteProject(UUID)
    case updateHours(projectId: UUID, hours: Int)
    case showAddProject
    case hideAddProject
}
