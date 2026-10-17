//
//  UserfulInfoView.swift
//  CorpPort
//
//  Created by Peter Kozlov on 14.10.2026.
//

import SwiftUI

struct UsefulInfoView: View {
    @Environment(AppRouter.self) var router

    // Демо-данные
    private let articles = [
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
    
    var body: some View {
        List(articles) { article in
            Button {
                router.infoPath.append(InfoRoute.article(article))
            } label: {
                VStack(alignment: .leading, spacing: 6) {
                    Text(article.title)
                        .font(.headline)
                    Text(article.content)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .lineLimit(2)
                }
                .padding(.vertical, 4)
            }
        }
        .navigationTitle("Полезная информация")
        .navigationBarTitleDisplayMode(.inline)
    }
}
