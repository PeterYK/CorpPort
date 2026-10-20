//
//  EmployeeView.swift
//  CorpPort
//
//  Created by Peter Kozlov on 15.10.2026.
//

import SwiftUI

struct EmployeeView: View {
    let store: EmployeeStore
    
    init(employee: Employee, tab: TabType, rootStore: RootStore) {
        self.store = rootStore.makeEmployeeStore(employee: employee, tab: tab)
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                
                avatarBlock(name: store.employee.name)
                    .padding(.top)
                
                userInfoBlock(store: store)
                    .padding(.horizontal)
                
                // Подчинённые
                if store.isLeader, let subordinates = store.subordinates, !subordinates.isEmpty {
                    subordinatesBlock(subordinates: subordinates)
                }
            }
            .padding(.bottom, 30)
        }
    }
}

extension EmployeeView {
    private func avatarBlock(name: String) -> some View {
        VStack(spacing: 12) {
            Circle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: 100, height: 100)
                .overlay {
                    Image(systemName: "person.fill")
                        .font(.system(size: 40))
                        .foregroundStyle(.brand)
                }
            
            Text(store.employee.name)
                .font(.title2.bold())
                .multilineTextAlignment(.center)
                .lineLimit(3)
        }
    }
    
    private func userInfoBlock(store: EmployeeStore) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            infoRow(title: "Роль", value: store.employee.position)
            
            // Команда (кликабельная)
            if let team = store.employee.team {
                Button {
                    store.dispatch(.teamTapped)
                } label: {
                    infoRow(title: "Команда", value: team.name, isInteractive: true)
                }
                .buttonStyle(.plain)
            }
            
            // Руководитель (кликабельный)
            if let manager = store.employee.manager {
                Button {
                    store.dispatch(.employeeTapped(manager))
                } label: {
                    infoRow(title: "Руководитель", value: manager.name, isInteractive: true)
                }
                .buttonStyle(.plain)
            }
            
            // Город
            if let city = store.employee.city {
                infoRow(title: "Город", value: city)
            }
            
            // День рождения
            if let birthday = store.employee.birthday {
                infoRow(title: "День рождения", value: birthday)
            }
            
            // Почта (кликабельная)
            if let email = store.employee.email {
                Button {
                    store.dispatch(.emailTapped)
                } label: {
                    infoRow(title: "Почта", value: email, isInteractive: true)
                }
                .buttonStyle(.plain)
            }
            
            // Telegram (кликабельный)
            if let tg = store.employee.tg {
                Button {
                    store.dispatch(.telegramTapped)
                } label: {
                    infoRow(title: "Telegram", value: tg, isInteractive: true)
                }
                .buttonStyle(.plain)
            }
        }
    }
    
    private func subordinatesBlock(subordinates: [Employee]) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Подчинённые")
                .font(.headline)
                .padding(.horizontal)
            
            VStack(spacing: 0) {
                ForEach(subordinates) { subordinate in
                    Button {
                        store.dispatch(.employeeTapped(subordinate))
                    } label: {
                        EmployeeRow(employee: subordinate)
                    }
                    .buttonStyle(.plain)
                }
            }
            .background(Color.gray.opacity(0.08))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.horizontal)
        }
    }
    
    // MARK: - Helpers
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
