//
//  WallView.swift
//  CorpPort
//
//  Created by Peter Kozlov on 14.10.2026.
//

import SwiftUI

struct WallView: View {
    @Environment(RootStore.self) var rootStore
    
    var body: some View {
        
        VStack(spacing: 0) {
            // Теги
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    tagButton(title: "Все", isSelected: rootStore.wallStore.selectedTag == nil) {
                        rootStore.wallStore.dispatch(.selectTag(nil))
                    }

                    
                    ForEach(rootStore.wallStore.tags, id: \.self) { tag in
                        tagButton(title: tag, isSelected: rootStore.wallStore.selectedTag == tag) {
                            rootStore.wallStore.dispatch(.selectTag(tag))
                        }

                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
            }
            
            // Список постов
            List(rootStore.wallStore.filteredPosts) { post in
                Button {
                    rootStore.wallStore.dispatch(.postTapped(post))
                } label: {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(post.tag)
                            .font(.caption)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.blue.opacity(0.15))
                            .clipShape(Capsule())
                        
                        Text(post.title)
                            .font(.headline)
                        
                        Text(post.content)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .lineLimit(2)
                        
                        Text(post.company)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .padding(.top, 4)
                    }
                    .padding(.vertical, 6)
                }
            }
        }
        .navigationTitle("Стена")
//        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func tagButton(title: String, isSelected: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(title)
                .font(.subheadline)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(isSelected ? Color.brand : Color.gray.opacity(0.15))
                .foregroundStyle(isSelected ? .white : .primary)
                .clipShape(Capsule())
        }
        .buttonStyle(.plain)
    }
}
