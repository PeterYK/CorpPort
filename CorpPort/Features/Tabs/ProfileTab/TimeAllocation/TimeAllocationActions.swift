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
    case addProject(Project)
    case deleteProject(Int)
    case updateHours(projectId: Int, hours: Int)
    case showAddProject
    case hideAddProject
    case save
}
