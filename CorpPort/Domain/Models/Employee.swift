//
//  Employee.swift
//  CorpPort
//
//  Created by Peter Kozlov on 15.10.2026.
//

import Foundation

final class Employee: Identifiable, Hashable {
    let id: Int
    let name: String
    let position: String
    var team: Team?
    var manager: Employee?
    let city: String?
    let birthday: String?
    let email: String?
    let tg: String?
    
    init(
        id: Int,
        name: String,
        position: String,
        team: Team? = nil,
        manager: Employee? = nil,
        city: String? = nil,
        birthday: String? = nil,
        email: String? = nil,
        tg: String? = nil
        
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
    }
    
    static func == (lhs: Employee, rhs: Employee) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
