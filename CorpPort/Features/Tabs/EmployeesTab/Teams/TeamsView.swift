//
//  TeamsView.swift
//  CorpPort
//
//  Created by Peter Kozlov on 14.10.2026.
//

import SwiftUI

struct TeamsView: View {
    @Environment(AppState.self) var appState
    
    private let teams = [
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
    ]
    
    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        @Bindable var appState = appState
        
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(teams) { team in
                    Button {
                        appState.employeesPath.append(TeamsRoute.team(team))
                    } label: {
                        TeamCell(team: team)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding()
        }
    }
}
