//
//  WallStore.swift
//  CorpPort
//
//  Created by Peter Kozlov on 17.10.2026.
//

import SwiftUI

@Observable
final class WallStore {
    @ObservationIgnored private var dataService: DataService = ServiceLocator.shared.getService()

    private var router: AppRouter
    var selectedTag: String? = nil

    // TODO: Демо-данные
    private var allPosts: [WallPost] {
        dataService.wallPosts
    }
    
    var tags: [String] {
        Array(Set(allPosts.map { $0.tag })).sorted()
    }
    
    var filteredPosts: [WallPost] {
        guard let selectedTag else { return allPosts }
        return allPosts.filter { $0.tag == selectedTag }
    }
    
    init (router: AppRouter) {
        self.router = router
    }
    
    func dispatch(_ action: WallActions) {
        switch action {
        case .postTapped(let post):
            router.wallPath.append(WallRoute.post(post))
        case .selectTag(let tag):
            if let tag {
                selectedTag = tag
            } else {
                selectedTag = nil
            }
        case .usefulInfoTapped:
            router.wallPath.append(WallRoute.info)
        }
    }
    
    func reset() {
        selectedTag = nil
    }
}
