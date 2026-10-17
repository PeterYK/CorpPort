//
//  TeamView.swift
//  CorpPort
//
//  Created by Peter Kozlov on 15.10.2026.
//

import SwiftUI

struct TeamView: View {
    let team: Team
    
    var onEmployeeTap: (Employee) -> Void
    
    @Environment(AppState.self) var appState
    
    var body: some View {
        @Bindable var appState = appState
        
        ScrollView {
            VStack(spacing: 24) {
                // Маскот + описание
                VStack(spacing: 12) {
                    Circle()
                        .fill(Color.blue.opacity(0.15))
                        .frame(width: 100, height: 100)
                        .overlay {
                            Image(systemName: team.mascotIcon)
                                .font(.system(size: 44))
                                .foregroundStyle(.blue)
                        }
                    
                    Text(team.name)
                        .font(.title.bold())
                    
                    Text(team.description)
                        .font(.body)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                .padding(.top)
                
                // Руководители
                if !team.leaders.isEmpty {
                    section(title: team.leaders.count > 1 ? "Руководители" : "Руководитель") {
                        ForEach(team.leaders) { leader in
                            Button {
                                onEmployeeTap(leader)
                            } label: {
                                EmployeeRow(employee: leader)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                
                // Участники
                if !team.members.isEmpty {
                    section(title: "Участники") {
                        ForEach(team.members) { member in
                            Button {
                                onEmployeeTap(member)
                            } label: {
                                EmployeeRow(employee: member)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
            }
        }
        .navigationTitle(team.name)
        .navigationBarTitleDisplayMode(.inline)
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

