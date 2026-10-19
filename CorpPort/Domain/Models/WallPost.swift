//
//  WallPost.swift
//  CorpPort
//
//  Created by Peter Kozlov on 15.10.2026.
//

import Foundation

struct WallPost: Identifiable, Hashable {
    let id = UUID()
    let tag: String
    let title: String
    let content: String
    let company: String
}
