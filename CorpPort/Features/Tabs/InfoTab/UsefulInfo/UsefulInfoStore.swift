//
//  UsefulInfoStore.swift
//  CorpPort
//
//  Created by Peter Kozlov on 17.10.2026.
//

import SwiftUI

@Observable
final class UsefulInfoStore {
    @ObservationIgnored private var dataService: DataService = ServiceLocator.shared.getService()

    private var router: AppRouter
    
    // TODO: Демо-данные
    var articles: [InfoArticle] {
        dataService.infoArticles
    }
    
    init (router: AppRouter) {
        self.router = router
    }
    
    func dispatch(_ action: UsefulInfoActions) {
        switch action {
        case .articleTapped(let article):
            router.infoPath.append(InfoRoute.article(article))
        }
    }
    
}
