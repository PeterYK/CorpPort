//
//  UserProfileDTO.swift
//  CorpPort
//
//  Created by Peter Kozlov on 18.10.2026.
//

import Foundation

struct UserProfileDTO: Codable, Identifiable {
    let id: Int
    let name: String
    let position: String
    let teamId: Int?
    let managerId: Int?
    let city: String?
    let birthday: String?
    let email: String?
    let telegram: String?
    let favoriteProjectIds: [Int]?
    let missedDates: [String]?
}
