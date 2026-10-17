//
//  WallView.swift
//  CorpPort
//
//  Created by Peter Kozlov on 14.10.2026.
//

import SwiftUI

struct WallView: View {
    @Environment(AppRouter.self) var router

    @State private var selectedTag: String? = nil
    
    // Демо-данные
    private let allPosts: [WallPost] = [
        WallPost(tag: "Новости", title: "Запуск нового продукта", content: "Мы рады сообщить о запуске нового корпоративного продукта. Подробности внутри.", company: "ООО \"Технологии\""),
        WallPost(tag: "Мероприятия", title: "Корпоратив в эту пятницу", content: "Приглашаем всех на корпоратив. Будет интересно!", company: "ООО \"Технологии\""),
        WallPost(tag: "Новости", title: "Обновление политик", content: "Ознакомьтесь с обновлёнными внутренними политиками компании.", company: "ООО \"Технологии\""),
        WallPost(tag: "Сезонное", title: "Летний график работы", content: "С 1 июня действует летний график. Подробности в посте.", company: "ООО \"Технологии\"")
    ]
    
    private var tags: [String] {
        Array(Set(allPosts.map { $0.tag })).sorted()
    }
    
    private var filteredPosts: [WallPost] {
        guard let selectedTag else { return allPosts }
        return allPosts.filter { $0.tag == selectedTag }
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            // Теги
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    tagButton(title: "Все", isSelected: selectedTag == nil) {
                        selectedTag = nil
                    }
                    
                    ForEach(tags, id: \.self) { tag in
                        tagButton(title: tag, isSelected: selectedTag == tag) {
                            selectedTag = tag
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
            }
            
            // Список постов
            List(filteredPosts) { post in
                Button {
                    router.wallPath.append(WallRoute.post(post))
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
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func tagButton(title: String, isSelected: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(title)
                .font(.subheadline)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(isSelected ? Color.blue : Color.gray.opacity(0.15))
                .foregroundStyle(isSelected ? .white : .primary)
                .clipShape(Capsule())
        }
        .buttonStyle(.plain)
    }
}
