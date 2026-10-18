//
//  UsefulInfoStore.swift
//  CorpPort
//
//  Created by Peter Kozlov on 17.10.2026.
//

import SwiftUI

@Observable
final class UsefulInfoStore {
    
    private var router: AppRouter

    // Демо-данные
    let articles = [
        InfoArticle(
            title: "Как оформить отпуск",
            content: "Для оформления отпуска необходимо подать заявку в HR-портале не менее чем за 2 недели. Согласование происходит через руководителя."
        ),
        InfoArticle(
            title: "Правила удалённой работы",
            content: "Удалённая работа возможна по согласованию с руководителем. Необходимо быть на связи в рабочие часы и участвовать в ежедневных стендапах."
        ),
        InfoArticle(
            title: "Корпоративные бенефиты",
            content: "Компания предоставляет ДМС, компенсацию спорта, обучение и другие бенефиты. Подробности можно уточнить в HR."
        )
    ]
    
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
