//
//  EmployeesStore.swift
//  CorpPort
//
//  Created by Peter Kozlov on 17.10.2026.
//

import SwiftUI

@Observable
final class EmployeesStore {
    private var router: AppRouter
//    name: String,
//    position: String,
//    team: Team? = nil,
//    manager: Employee? = nil,
//    city: String? = nil,
//    birthday: String? = nil,
//    email: String? = nil
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
        
    init (router: AppRouter) {
        self.router = router
    }
    
    func dispatch(_ action: EmployeesActions) {
        switch action {
        case .employeeTapped(let employee):
            router.employeesPath.append(EmployeesRoute.employee(employee))
        }
    }
    
}
