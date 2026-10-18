//
//  WallStore.swift
//  CorpPort
//
//  Created by Peter Kozlov on 17.10.2026.
//

import SwiftUI

@Observable
final class WallStore {
    
    private var router: AppRouter
    var selectedTag: String? = nil

    // Демо-данные
    private let allPosts: [WallPost] = [
        WallPost(tag: "Новости", title: "Запуск нового продукта", content: "Мы рады сообщить о запуске нового корпоративного продукта. Подробности внутри.", company: "ООО \"Технологии\""),
        WallPost(tag: "Мероприятия", title: "Корпоратив в эту пятницу", content: "Приглашаем всех на корпоратив. Будет интересно!", company: "ООО \"Технологии\""),
        WallPost(tag: "Новости", title: "Обновление политик", content: "Ознакомьтесь с обновлёнными внутренними политиками компании.", company: "ООО \"Технологии\""),
        WallPost(tag: "Сезонное", title: "Летний график работы", content: "С 1 июня действует летний график. Подробности в посте.", company: "ООО \"Технологии\"")
    ]
    
    var tags: [String] {
        Array(Set(allPosts.map { $0.tag })).sorted()
    }
    
    var filteredPosts: [WallPost] {
        guard let selectedTag else { return allPosts }
        return allPosts.filter { $0.tag == selectedTag }
    }
    
    init (router: AppRouter) {
        self.router = router
    }
    
    func dispatch(_ action: WallActions) {
        switch action {
        case .postTapped(let post):
            router.wallPath.append(WallRoute.post(post))
        case .selectTag(let tag):
            if let tag {
                selectedTag = tag
            } else {
                selectedTag = nil
            }
        }
    }
    
}
