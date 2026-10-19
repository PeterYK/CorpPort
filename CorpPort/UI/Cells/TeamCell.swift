//
//  TeamCell.swift
//  CorpPort
//
//  Created by Peter Kozlov on 15.10.2026.
//

import SwiftUI

struct TeamCell: View {
    let team: Team
    
    var body: some View {
        VStack(spacing: 12) {
            Circle()
                .fill(Color.blue.opacity(0.15))
                .frame(width: 80, height: 80)
                .overlay {
                    Image(systemName: team.mascotIcon)
                        .font(.system(size: 32))
                        .foregroundStyle(.brand)
                }
            
            Text(team.name)
                .font(.headline)
                .multilineTextAlignment(.center)
                .lineLimit(2)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.gray.opacity(0.08))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
