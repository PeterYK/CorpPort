//
//  TeamDTO.swift
//  CorpPort
//
//  Created by Peter Kozlov on 18.10.2026.
//

import Foundation

struct TeamDTO: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let mascotIcon: String
    let leaderIds: [Int]
    let memberIds: [Int]
}
