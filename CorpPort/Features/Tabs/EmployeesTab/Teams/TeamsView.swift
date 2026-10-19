//
//  TeamsView.swift
//  CorpPort
//
//  Created by Peter Kozlov on 14.10.2026.
//

import SwiftUI

struct TeamsView: View {
    @Environment(RootStore.self) var rootStore
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: rootStore.teamsStore.columns, spacing: 16) {
                ForEach(rootStore.teamsStore.teams) { team in
                    Button {
                        rootStore.teamsStore.dispatch(.teamTapped(team))
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
