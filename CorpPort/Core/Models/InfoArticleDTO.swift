//
//  InfoArticleDTO.swift
//  CorpPort
//
//  Created by Peter Kozlov on 18.10.2026.
//

import Foundation

struct InfoArticleDTO: Codable, Identifiable {
    let id: Int
    let title: String
    let content: String
}
