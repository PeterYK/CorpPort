//
//  InfoArticleStore.swift
//  CorpPort
//
//  Created by Peter Kozlov on 20.10.2026.
//

import Foundation
import SwiftUI

@Observable
final class InfoArticleStore {
    let article: InfoArticle
    private let router: AppRouter
    
    init(article: InfoArticle, router: AppRouter) {
        self.article = article
        self.router = router
    }
    
    func dispatch(_ action: InfoArticleActions) {
        switch action {
        case .contactTapped(let employee):
            router.wallPath.append(WallRoute.employee(employee))
        }
    }
}
