//
//  AppDataService.swift
//  CorpPort
//
//  Created by Peter Kozlov on 17.10.2026.
//

import Foundation

final class AppDataService: DataService {
    private let networkService: NetworkService
    
    private(set) var employees: [Employee] = []
    private(set) var teams: [Team] = []
    private(set) var wallPosts: [WallPost] = []
    private(set) var infoArticles: [InfoArticle] = []
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func loadAllData() async throws {
        async let employeesDTO = networkService.fetchEmployees()
        async let teamsDTO = networkService.fetchTeams()
        async let postsDTO = networkService.fetchWallPosts()
        async let articlesDTO = networkService.fetchInfoArticles()
        
        let (empDTO, teamDTO, postDTO, artDTO) = try await (employeesDTO, teamsDTO, postsDTO, articlesDTO)
        
        // Маппинг сотрудников и команд
        let (mappedEmployees, mappedTeams) = MockDataMapper.map(
            employeesDTO: empDTO,
            teamsDTO: teamDTO
        )
        
        employees = mappedEmployees
        teams = mappedTeams
        
        // Маппинг постов и статей (простой)
        wallPosts = postDTO.map { dto in
            WallPost(
                tag: dto.tag,
                title: dto.title,
                content: dto.content,
                company: dto.company
            )
        }
        
        infoArticles = artDTO.map { dto in
            InfoArticle(
                title: dto.title,
                content: dto.content
            )
        }
    }}
