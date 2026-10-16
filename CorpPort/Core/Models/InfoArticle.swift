//
//  InfoArticle.swift
//  CorpPort
//
//  Created by Peter Kozlov on 15.10.2026.
//

import Foundation

struct InfoArticle: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let content: String
}
