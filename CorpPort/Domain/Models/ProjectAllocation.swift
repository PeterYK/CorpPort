//
//  ProjectAllocation.swift
//  CorpPort
//
//  Created by Peter Kozlov on 15.10.2026.
//

import Foundation

struct ProjectAllocation: Identifiable {
    let id: Int
    let project: Project
    var hours: Int
    
    init(project: Project, hours: Int = 0) {
        self.id = project.id
        self.project = project
        self.hours = hours
    }
}
