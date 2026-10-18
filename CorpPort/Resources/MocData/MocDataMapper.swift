//
//  MocDataMapper.swift
//  CorpPort
//
//  Created by Peter Kozlov on 18.10.2026.
//

import Foundation

enum MockDataMapper {
    
    static func map(
        employeesDTO: [EmployeeDTO],
        teamsDTO: [TeamDTO]
    ) -> (employees: [Employee], teams: [Team]) {
        
        // 1. Создаём всех сотрудников без связей
        var employeeById: [Int: Employee] = [:]
        
        for dto in employeesDTO {
            let employee = Employee(
                name: dto.name,
                position: dto.position,
                city: dto.city,
                birthday: dto.birthday,
                email: dto.email,
                tg: dto.telegram
            )
            employeeById[dto.id] = employee
        }
        
        // 2. Проставляем руководителей
        for dto in employeesDTO {
            guard let employee = employeeById[dto.id],
                  let managerId = dto.managerId,
                  let manager = employeeById[managerId] else { continue }
            
            employee.manager = manager
        }
        
        // 3. Создаём команды
        var teams: [Team] = []
        var teamById: [Int: Team] = [:]
        
        for dto in teamsDTO {
            let leaders = dto.leaderIds.compactMap { employeeById[$0] }
            let members = dto.memberIds.compactMap { employeeById[$0] }
            
            let team = Team(
                name: dto.name,
                description: dto.description,
                mascotIcon: dto.mascotIcon,
                leaders: leaders,
                members: members
            )
            
            teams.append(team)
            teamById[dto.id] = team
        }
        
        // 4. Привязываем команды к сотрудникам
        for dto in employeesDTO {
            guard let employee = employeeById[dto.id],
                  let teamId = dto.teamId,
                  let team = teamById[teamId] else { continue }
            
            employee.team = team
        }
        
        let employees = employeesDTO.compactMap { employeeById[$0.id] }
        
        return (employees, teams)
    }
}
