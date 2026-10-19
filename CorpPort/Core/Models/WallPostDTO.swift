//
//  WallPostDTO.swift
//  CorpPort
//
//  Created by Peter Kozlov on 18.10.2026.
//

import Foundation

struct WallPostDTO: Codable, Identifiable {
    let id: Int
    let tag: String
    let title: String
    let content: String
    let company: String
}
