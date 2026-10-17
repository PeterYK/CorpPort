//
//  WallPostView.swift
//  CorpPort
//
//  Created by Peter Kozlov on 15.10.2026.
//

import SwiftUI

struct WallPostView: View {
    let post: WallPost
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(post.tag)
                    .font(.caption)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.blue.opacity(0.15))
                    .clipShape(Capsule())
                
                Text(post.title)
                    .font(.title2.bold())
                
                Text(post.content)
                    .font(.body)
                
                Text(post.company)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .padding(.top, 8)
            }
            .padding()
        }
        .navigationTitle("Пост")
        .navigationBarTitleDisplayMode(.inline)
    }
}
