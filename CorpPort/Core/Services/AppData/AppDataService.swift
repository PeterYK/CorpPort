//
//  AppDataService.swift
//  CorpPort
//
//  Created by Peter Kozlov on 17.10.2026.
//

import Foundation

final class AppDataService: DataService {
    private let networkService: NetworkService
    
    private(set) var userProfile: UserProfile?
    private(set) var employees: [Employee] = []
    private(set) var teams: [Team] = []
    private(set) var wallPosts: [WallPost] = []
    private(set) var infoArticles: [InfoArticle] = []
    private(set) var projects: [Project] = []
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func loadAllData() async throws {
        async let userProfileDTO = networkService.fetchUserProfile()
        async let employeesDTO = networkService.fetchEmployees()
        async let teamsDTO = networkService.fetchTeams()
        async let postsDTO = networkService.fetchWallPosts()
        async let articlesDTO = networkService.fetchInfoArticles()
        async let projectsDTO = networkService.fetchProjects()
        
        let (empDTO, teamDTO, postDTO, artDTO, userProfDTO, projDTO) = try await (employeesDTO, teamsDTO, postsDTO, articlesDTO, userProfileDTO, projectsDTO)
        
        // Маппинг сотрудников и команд
        let (mappedEmployees, mappedTeams, mappedUserProfile) = MockDataMapper.map(
            employeesDTO: empDTO,
            teamsDTO: teamDTO,
            userProfileDTO: userProfDTO
        )
        
        employees = mappedEmployees
        teams = mappedTeams
        
        
        let updatedProfile = MockDataMapper.map(
            userProfile: mappedUserProfile,
            projectsDTO: projDTO,
            userProfileDTO: userProfDTO
        )
        userProfile = updatedProfile
        
        wallPosts = postDTO.map { dto in
            WallPost(
                tag: dto.tag,
                title: dto.title,
                content: dto.content,
                company: dto.company
            )
        }
        
        infoArticles = MockDataMapper.map(articlesDTO: artDTO, employees: employees)
        
        projects = projDTO.map { Project(id: $0.id, name: $0.name) }
    }
    
    func reset() {
        employees = []
        teams = []
        wallPosts = []
        infoArticles = []
        projects = []
        userProfile = nil
    }
}
