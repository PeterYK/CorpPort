//
//  InfoArticleView.swift
//  CorpPort
//
//  Created by Peter Kozlov on 15.10.2026.
//

import SwiftUI

struct InfoArticleView: View {
    let article: InfoArticle
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(article.title)
                    .font(.title2.bold())
                
                Text(article.content)
                    .font(.body)
            }
            .padding()
        }
        .navigationTitle("Статья")
        .navigationBarTitleDisplayMode(.inline)
    }
}
