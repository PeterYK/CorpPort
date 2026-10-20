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
        teamsDTO: [TeamDTO],
        userProfileDTO: UserProfileDTO
    ) -> (employees: [Employee], teams: [Team], userProfile: UserProfile) {
        
        // 1. Создаём всех сотрудников без связей
        var employeeById: [Int: Employee] = [:]
        
        for dto in employeesDTO {
            let employee = Employee(
                id: dto.id,
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
                id: dto.id,
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
        
        // 5. Собираем UserProfile
        let userTeam = userProfileDTO.teamId.flatMap { teamById[$0] }
        let userManager = userProfileDTO.managerId.flatMap { employeeById[$0] }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        let missed = (userProfileDTO.missedDates ?? []).compactMap {
            dateFormatter.date(from: $0)
        }
        
        let userProfile = UserProfile(
            id: userProfileDTO.id,
            name: userProfileDTO.name,
            position: userProfileDTO.position,
            team: userTeam,
            manager: userManager,
            city: userProfileDTO.city,
            birthday: userProfileDTO.birthday,
            email: userProfileDTO.email,
            tg: userProfileDTO.telegram,
            missedDates: missed
        )
        
        return (employees, teams, userProfile)
    }
    
    static func map(userProfile: UserProfile, projectsDTO: [ProjectDTO], userProfileDTO: UserProfileDTO ) -> UserProfile {
        // Преобразуем все проекты
            let allProjects = projectsDTO.map { Project(id: $0.id, name: $0.name) }
            
            // Находим избранные по id из DTO
            let favoriteIds = userProfileDTO.favoriteProjectIds ?? []
            let favorites = allProjects.filter { favoriteIds.contains($0.id) }
            
            // Обновляем профиль
            userProfile.favoriteProjects = favorites
            
            return userProfile
    }
    
    static func map(
        articlesDTO: [InfoArticleDTO],
        employees: [Employee]
    ) -> [InfoArticle] {
        articlesDTO.map { dto in
            let contacts = dto.contactIds.compactMap { id in
                employees.first { $0.id == id }
            }
            return InfoArticle(
                id: dto.id,
                title: dto.title,
                content: dto.content,
                contacts: contacts
            )
        }
    }
}
