//
//  ProfileView.swift
//  CorpPort
//
//  Created by Peter Kozlov on 14.10.2026.
//

import SwiftUI

struct ProfileView: View {
    @Environment(AppState.self) var appState
    
    // отладочные данные-данные
    private let fullName = "Иван Иванов"
    private let role = "iOS-разработчик"
    private let team =  Team(
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
    private let manager = Employee(name: "Алексей Смирнов", position: "Team Lead")
    private let location = "Москва"
    private let birthday = "15 марта"
    private let email = "ivan.ivanov@company.com"
    
    var body: some View {
        @Bindable var appState = appState
        
        ScrollView {
            VStack(spacing: 24) {
                // Плитки-кнопки
                HStack(spacing: 16) {
                    tileButton(title: "ТРЗ", icon: "calendar", badge: 3) {
                        appState.profilePath.append(ProfileRoute.timeAllocation)
                    }
                    tileButton(title: "Моя команда", icon: "person.3") {
                        appState.profilePath.append(ProfileRoute.myTeam(team))
                    }
                }
                .padding(.horizontal)
                .padding(.top, 20)
                HStack(spacing: 16) {
                    Circle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 80, height: 80)
                        .overlay {
                            Image(systemName: "person.fill")
                                .font(.system(size: 32))
                                .foregroundStyle(.gray)
                        }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(fullName)
                            .font(.title2.bold())
                        Text(role)   // можно оставить роль рядом или убрать
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 10)
                // Информация
                VStack(alignment: .leading, spacing: 12) {
                    infoRow(title: "Роль", value: role)
                    
                    // Интерактивная команда
                    Button {
                        appState.profilePath.append(ProfileRoute.myTeam(team))
                    } label: {
                        infoRow(title: "Команда", value: team.name, isInteractive: true)
                    }
                    .buttonStyle(.plain)
                    
                    // Интерактивный руководитель
                    Button {
                        appState.profilePath.append(ProfileRoute.employee(manager))
                    } label: {
                        infoRow(title: "Руководитель", value: manager.name, isInteractive: true)
                    }
                    .buttonStyle(.plain)
                    
                    infoRow(title: "Локация", value: location)
                    infoRow(title: "День рождения", value: birthday)
                    infoRow(title: "Почта", value: email)
                }
                .padding(.horizontal)
                
                Spacer()
                
                // Выход
                Button("Выйти") {
                    appState.isAuthenticated = false
                    appState.profilePath = NavigationPath()
                }
                .foregroundStyle(.red)
                .padding(.top, 20)
            }
            .padding(.bottom, 15)
        }
        .navigationTitle("Кабинет")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: - Вспомогательные вью
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
    
    private func tileButton(
        title: String,
        icon: String,
        badge: Int? = nil,
        action: @escaping () -> Void
    ) -> some View {
        Button(action: action) {
            ZStack(alignment: .topTrailing) {
                VStack(spacing: 8) {
                    Image(systemName: icon)
                        .font(.title2)
                    Text(title)
                        .font(.subheadline.weight(.medium))
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(Color.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
                // Бейдж
                if let badge, badge > 0 {
                    Text("\(badge)")
                        .font(.caption2.bold())
                        .foregroundStyle(.white)
                        .padding(5)
                        .background(Color.red)
                        .clipShape(Circle())
                        .offset(x: -8, y: 5)
                }
            }
        }
        .buttonStyle(.plain)
    }
}
