//
//  Employee.swift
//  CorpPort
//
//  Created by Peter Kozlov on 15.10.2026.
//

import Foundation

final class Employee: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let position: String
    let team: Team?
    var manager: Employee?
    let city: String?
    let birthday: String?
    let email: String?
    
    init(
        name: String,
        position: String,
        team: Team? = nil,
        manager: Employee? = nil,
        city: String? = nil,
        birthday: String? = nil,
        email: String? = nil
    ) {
        self.name = name
        self.position = position
        self.team = team
        self.manager = manager
        self.city = city
        self.birthday = birthday
        self.email = email
    }
    
    static func == (lhs: Employee, rhs: Employee) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
