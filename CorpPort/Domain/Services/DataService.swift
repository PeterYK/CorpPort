//
//  AppDataService.swift
//  CorpPort
//
//  Created by Peter Kozlov on 17.10.2026.
//

import Foundation

protocol DataService {
    var employees: [Employee] { get }
    var teams: [Team] { get }
    var wallPosts: [WallPost] { get }
    var infoArticles: [InfoArticle] { get }
    
    func loadAllData() async throws
}
