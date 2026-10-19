//
//  ProfileView.swift
//  CorpPort
//
//  Created by Peter Kozlov on 14.10.2026.
//

import SwiftUI

struct ProfileView: View {
    @Environment(RootStore.self) var rootStore
    
    var body: some View {
        if let userProfile = rootStore.profileStore.userProfile,
           let team = userProfile.team {
            ScrollView {
                VStack(spacing: 24) {
                    HStack(spacing: 16) {
                        if rootStore.profileStore.missedCount > 0 {
                            tileButton(title: "ТРЗ", icon: "calendar", badge: rootStore.profileStore.missedCount) {
                                rootStore.profileStore.dispatch(.timeAllocationTapped)
                            }
                        }
                        tileButton(title: "Моя команда", icon: "person.3") {
                            rootStore.profileStore.dispatch(.teamTapped)
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
                            Text(userProfile.name)
                                .font(.title2.bold())
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    // Информация
                    VStack(alignment: .leading, spacing: 12) {
                        infoRow(title: "Роль", value: userProfile.position)
                        
                        // Интерактивная команда
                        Button {
                            rootStore.profileStore.dispatch(.teamTapped)
                        } label: {
                            infoRow(title: "Команда", value: team.name, isInteractive: true)
                        }
                        .buttonStyle(.plain)
                        
                        // Интерактивный руководитель
                        if let manager = userProfile.manager {
                            Button {
                                rootStore.profileStore.dispatch(.employeeTapped)
                            } label: {
                                infoRow(title: "Руководитель", value: manager.name, isInteractive: true)
                            }
                            .buttonStyle(.plain)
                        }
                        
                        if let location = userProfile.city {
                            infoRow(title: "Локация", value: location)
                        }
                        if let birthday = userProfile.birthday {
                            infoRow(title: "День рождения", value: birthday)
                        }
                        if let email = userProfile.email {
                            infoRow(title: "Почта", value: email)
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    // Выход
                    Button("Выйти") {
                        rootStore.profileStore.dispatch(.logoutTapped)
                    }
                    .foregroundStyle(.red)
                    .padding(.top, 20)
                }
                .padding(.bottom, 15)
            }
            .navigationTitle("Кабинет")
            .withAppLogo()
        } else {
            Text("Не удалось получить данные о пользователе")
        }
    }
}

extension ProfileView {
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
                        .tint(Color.brand)
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
