//
//  NetworkService.swift
//  CorpPort
//
//  Created by Peter Kozlov on 17.10.2026.
//

import Foundation

protocol NetworkService {
    func fetchEmployees() async throws -> [EmployeeDTO]
    func fetchTeams() async throws -> [TeamDTO]
    func fetchWallPosts() async throws -> [WallPostDTO]
    func fetchInfoArticles() async throws -> [InfoArticleDTO]
}
