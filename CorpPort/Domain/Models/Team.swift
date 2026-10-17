//
//  Team.swift
//  CorpPort
//
//  Created by Peter Kozlov on 15.10.2026.
//

import Foundation

struct Team: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let description: String
    let mascotIcon: String
    let leaders: [Employee]
    let members: [Employee]
}
