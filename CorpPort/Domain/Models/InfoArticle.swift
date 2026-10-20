//
//  InfoArticle.swift
//  CorpPort
//
//  Created by Peter Kozlov on 15.10.2026.
//

import Foundation

final class InfoArticle: Identifiable, Hashable {
    let id: Int
    let title: String
    let content: String
    let contacts: [Employee]
    
    init(
    id: Int,
    title: String,
    content: String,
    contacts: [Employee] = []
        
    ) {
        self.id = id
        self.title = title
        self.content = content
        self.contacts = contacts
    }
    
    static func == (lhs: InfoArticle, rhs: InfoArticle) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
