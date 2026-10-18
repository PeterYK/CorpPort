//
//  EmployeesView.swift
//  CorpPort
//
//  Created by Peter Kozlov on 14.10.2026.
//

import SwiftUI

struct EmployeesView: View {
    @Environment(RootStore.self) var rootStore

//    private let employees = [
//        Employee(name: "Иван Иванов", position: "iOS-разработчик"),
//        Employee(name: "Мария Петрова", position: "Дизайнер"),
//        Employee(name: "Алексей Смирнов", position: "Team Lead"),
//        Employee(name: "Ольга Кузнецова", position: "Backend-разработчик")
//    ]
    let employees = [
        Employee(name: "Иван Иванов",
                 position: "iOS-разработчик",
                 team: Team(
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
                 manager: nil,
                 city: "Москва",
                 birthday: "01.01.1980",
                 email: "ivan@mail.ru"),
        Employee(name: "Мария Петрова",
                 position: "Дизайнер",
                 team: Team(
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
                 manager: nil,
                 city: "Москва",
                 birthday: "01.01.1980",
                 email: "ivan@mail.ru"),
        Employee(name: "Алексей Смирнов",
                 position: "Team Lead",
                 team: Team(
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
                 manager: nil,
                 city: "Москва",
                 birthday: "01.01.1980",
                 email: "ivan@mail.ru"),
        Employee(name: "Ольга Кузнецова",
                 position: "Backend-разработчик",
                 team: Team(
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
                 manager: nil,
                 city: "Москва",
                 birthday: "01.01.1980",
                 email: "ivan@mail.ru")
    ]
    
    var body: some View {        
        List(employees) { employee in
            Button {
                rootStore.employeesStore.dispatch(.employeeTapped(employee))
            } label: {
                EmployeeCell(employee: employee)
            }
            .buttonStyle(.plain)
        }
        .listStyle(.plain)
    }
}
