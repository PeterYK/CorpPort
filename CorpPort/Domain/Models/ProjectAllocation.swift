//
//  ProjectAllocation.swift
//  CorpPort
//
//  Created by Peter Kozlov on 15.10.2026.
//

import Foundation

struct ProjectAllocation: Identifiable {
    let id = UUID()
    var name: String
    var hours: Int
}
