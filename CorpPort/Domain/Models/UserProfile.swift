//
//  UserProfile.swift
//  CorpPort
//
//  Created by Peter Kozlov on 18.10.2026.
//

import Foundation

final class UserProfile: Identifiable, Hashable {
    let id: Int
    let name: String
    let position: String
    var team: Team?
    var manager: Employee?
    let city: String?
    let birthday: String?
    let email: String?
    let tg: String?
    var favoriteProjects: [Project] = []
    var missedDates: [Date] = []
    
    init(
        id: Int,
        name: String,
        position: String,
        team: Team? = nil,
        manager: Employee? = nil,
        city: String? = nil,
        birthday: String? = nil,
        email: String? = nil,
        tg: String? = nil,
        favoriteProjects: [Project] = [],
        missedDates: [Date] = []
    ) {
        self.id = id
        self.name = name
        self.position = position
        self.team = team
        self.manager = manager
        self.city = city
        self.birthday = birthday
        self.email = email
        self.tg = tg
        self.favoriteProjects = favoriteProjects
        self.missedDates = missedDates
    }
    
    static func == (lhs: UserProfile, rhs: UserProfile) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
