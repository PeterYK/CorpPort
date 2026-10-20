//
//  InfoArticleView.swift
//  CorpPort
//
//  Created by Peter Kozlov on 15.10.2026.
//

import SwiftUI

struct InfoArticleView: View {
    let store: InfoArticleStore
    
    init(article: InfoArticle, rootStore: RootStore) {
        self.store = rootStore.makeInfoArticleStore(article: article)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Text(store.article.title)
                    .font(.title2.bold())
                
                Text(store.article.content)
                    .font(.body)
                
                if !store.article.contacts.isEmpty {
                    contactsBlock()
                }
            }
            .padding()
        }
        .navigationTitle("Статья")
        .navigationBarTitleDisplayMode(.inline)
    }
}

extension InfoArticleView {
    private func contactsBlock() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("За помощью обращайтесь к:")
                .font(.headline)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(store.article.contacts) { employee in
                        Button {
                            store.dispatch(.contactTapped(employee))
                        } label: {
                            ContactCell(employee: employee)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
    }
}
