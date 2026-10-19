//
//  TeamView.swift
//  CorpPort
//
//  Created by Peter Kozlov on 15.10.2026.
//

import SwiftUI

struct TeamView: View {
    let teamStore: TeamStore
    
    init(team: Team, tab: TabType, rootStore: RootStore) {
        self.teamStore = rootStore.makeTeamStore(team: team, tab: tab)
    }
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 24) {
                // Маскот + описание
                VStack(spacing: 12) {
                    Circle()
                        .fill(Color.blue.opacity(0.15))
                        .frame(width: 100, height: 100)
                        .overlay {
                            Image(systemName: teamStore.team.mascotIcon)
                                .font(.system(size: 44))
                                .foregroundStyle(.brand)
                        }
                    
                    Text(teamStore.team.name)
                        .font(.title.bold())
                    
                    Text(teamStore.team.description)
                        .font(.body)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                .padding(.top)
                
                // Руководители
                if !teamStore.team.leaders.isEmpty {
                    section(title: teamStore.team.leaders.count > 1 ? "Руководители" : "Руководитель") {
                        ForEach(teamStore.team.leaders) { leader in
                            Button {
                                teamStore.dispatch(.employeeTapped(leader))
                            } label: {
                                EmployeeRow(employee: leader)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                
                // Участники
                if !teamStore.team.members.isEmpty {
                    section(title: "Участники") {
                        ForEach(teamStore.team.members) { member in
                            Button {
                                teamStore.dispatch(.employeeTapped(member))
                            } label: {
                                EmployeeRow(employee: member)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
            }
        }
//        .navigationTitle(teamStore.team.name)
//        .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder
    private func section<Content: View>(title: String, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .padding(.horizontal)
            
            VStack(spacing: 0) {
                content()
            }
            .background(Color.gray.opacity(0.08))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.horizontal)
        }
    }
}

