//
//  EmployeeView.swift
//  CorpPort
//
//  Created by Peter Kozlov on 15.10.2026.
//

import SwiftUI

struct EmployeeView: View {
    let employee: Employee
    @Environment(AppState.self) var appState
    @Environment(AppRouter.self) var appRouter

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Аватар + ФИО
                VStack(spacing: 12) {
                    Circle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 100, height: 100)
                        .overlay {
                            Image(systemName: "person.fill")
                                .font(.system(size: 40))
                                .foregroundStyle(.gray)
                        }
                    
                    Text(employee.name)
                        .font(.title2.bold())
                        .multilineTextAlignment(.center)
                        .lineLimit(3)
                }
                .padding(.top)
                
                // Информация
                VStack(alignment: .leading, spacing: 12) {
                    infoRow(title: "Роль", value: employee.position)
                    
                    // Команда (интерактивная)
                    if let teamName = employee.teamName {
                        Button {
                            // Пример: ищем команду по имени или передаём готовую
                            // Здесь для демо просто показываем переход
                            let someTeam = Team(
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
                             appRouter.employeesPath.append(TeamsRoute.team(someTeam))
                        } label: {
                            infoRow(title: "Команда", value: teamName, isInteractive: true)
                        }
                        .buttonStyle(.plain)
                    }
                    
                    // Руководитель (интерактивный)
                    if let manager = employee.manager {
                        Button {
                            appRouter.employeesPath.append(EmployeesRoute.employee(manager))
                        } label: {
                            infoRow(title: "Руководитель", value: manager.name, isInteractive: true)
                        }
                        .buttonStyle(.plain)
                    }
                    
                    if let city = employee.city {
                        infoRow(title: "Город", value: city)
                    }
                    
                    if let birthday = employee.birthday {
                        infoRow(title: "День рождения", value: birthday)
                    }
                    
                    if let email = employee.email {
                        infoRow(title: "Почта", value: email)
                    }
                }
                .padding(.horizontal)
            }
            .padding(.bottom, 30)
        }
        .navigationTitle("Сотрудник")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func infoRow(title: String, value: String, isInteractive: Bool = false) -> some View {
        HStack {
            Text(title)
                .foregroundStyle(.secondary)
                .frame(width: 130, alignment: .leading)
            Text(value)
                .fontWeight(.medium)
                .foregroundStyle(isInteractive ? .blue : .primary)
            Spacer()
            if isInteractive {
                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }
}
