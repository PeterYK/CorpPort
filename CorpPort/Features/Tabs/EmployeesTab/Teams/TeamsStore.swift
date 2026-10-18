//
//  TeamsStore.swift
//  CorpPort
//
//  Created by Peter Kozlov on 17.10.2026.
//

import SwiftUI

@Observable
final class TeamsStore {
    
    private var router: AppRouter

    let teams = [
        Team(
            name: "Mobile",
            description: "Команда разработки мобильных приложений. Делаем iOS и Android клиенты корпоративного портала.",
            mascotIcon: "iphone",
            leaders: [
                Employee(name: "Алексей Смирнов", position: "Team Lead")
            ],
            members: [
                Employee(name: "Иван Иванов", position: "iOS-разработчик"),
                Employee(name: "Мария Петрова", position: "Дизайнер"),
                Employee(name: "Ольга Кузнецова", position: "Android-разработчик")
            ]
        ),
        Team(
            name: "Mobile",
            description: "Команда разработки мобильных приложений. Делаем iOS и Android клиенты корпоративного портала.",
            mascotIcon: "iphone",
            leaders: [
                Employee(name: "Алексей Смирнов", position: "Team Lead")
            ],
            members: [
                Employee(name: "Иван Иванов", position: "iOS-разработчик"),
                Employee(name: "Мария Петрова", position: "Дизайнер"),
                Employee(name: "Ольга Кузнецова", position: "Android-разработчик")
            ]
        ),
        Team(
            name: "Mobile",
            description: "Команда разработки мобильных приложений. Делаем iOS и Android клиенты корпоративного портала.",
            mascotIcon: "iphone",
            leaders: [
                Employee(name: "Алексей Смирнов", position: "Team Lead")
            ],
            members: [
                Employee(name: "Иван Иванов", position: "iOS-разработчик"),
                Employee(name: "Мария Петрова", position: "Дизайнер"),
                Employee(name: "Ольга Кузнецова", position: "Android-разработчик")
            ]
        ),
        Team(
            name: "Mobile",
            description: "Команда разработки мобильных приложений. Делаем iOS и Android клиенты корпоративного портала.",
            mascotIcon: "iphone",
            leaders: [
                Employee(name: "Алексей Смирнов", position: "Team Lead")
            ],
            members: [
                Employee(name: "Иван Иванов", position: "iOS-разработчик"),
                Employee(name: "Мария Петрова", position: "Дизайнер"),
                Employee(name: "Ольга Кузнецова", position: "Android-разработчик")
            ]
        ),
        Team(
            name: "Mobile",
            description: "Команда разработки мобильных приложений. Делаем iOS и Android клиенты корпоративного портала.",
            mascotIcon: "iphone",
            leaders: [
                Employee(name: "Алексей Смирнов", position: "Team Lead")
            ],
            members: [
                Employee(name: "Иван Иванов", position: "iOS-разработчик"),
                Employee(name: "Мария Петрова", position: "Дизайнер"),
                Employee(name: "Ольга Кузнецова", position: "Android-разработчик")
            ]
        )
    ]
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    init (router: AppRouter) {
        self.router = router
    }
    
    func dispatch(_ action: TeamsActions) {
        switch action {
        case .teamTapped(let team):
            router.employeesPath.append(TeamsRoute.team(team))
        }
    }
    
}
