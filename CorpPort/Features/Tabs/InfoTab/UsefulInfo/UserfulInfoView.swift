//
//  UserfulInfoView.swift
//  CorpPort
//
//  Created by Peter Kozlov on 14.10.2026.
//

import SwiftUI

struct UsefulInfoView: View {
    @Environment(RootStore.self) var rootStore
    
    var body: some View {
        List(rootStore.infoStore.articles) { article in
            Button {
                rootStore.infoStore.dispatch(.articleTapped(article))
            } label: {
                VStack(alignment: .leading, spacing: 6) {
                    Text(article.title)
                        .font(.headline)
                    Text(article.content)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .lineLimit(2)
                }
                .padding(.vertical, 4)
            }
        }
        .navigationTitle("Полезное")
    }
}
