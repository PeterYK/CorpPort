//
//  MocData.swift
//  CorpPort
//
//  Created by Peter Kozlov on 18.10.2026.
//

import Foundation

enum MockData {
    
    // MARK: - Сотрудники
    static let employees: [EmployeeDTO] = [
        // Администрация
        .init(id: 10000001, name: "Александр Волков", position: "Генеральный директор", teamId: 20000001, managerId: nil, city: "Москва", birthday: "12.04.1978", email: "a.volkov@company.ru", telegram: "@avolkov"),
        .init(id: 10000002, name: "Елена Соколова", position: "Финансовый директор", teamId: 20000001, managerId: 10000001, city: "Москва", birthday: "03.09.1982", email: "e.sokolova@company.ru", telegram: "@esokolova"),
        .init(id: 10000003, name: "Дмитрий Орлов", position: "Технический директор", teamId: 20000001, managerId: 10000001, city: "Москва", birthday: "21.11.1980", email: "d.orlov@company.ru", telegram: "@dorlov"),
        .init(id: 10000004, name: "Марина Кузнецова", position: "Главный юрист", teamId: 20000001, managerId: 10000001, city: "Москва", birthday: "15.06.1985", email: "m.kuznetsova@company.ru", telegram: "@mkuznetsova"),
        
        // Бухгалтерия
        .init(id: 10000005, name: "Ольга Новикова", position: "Главный бухгалтер", teamId: 20000002, managerId: 10000002, city: "Москва", birthday: "08.02.1988", email: "o.novikova@company.ru", telegram: nil),
        .init(id: 10000006, name: "Анна Белова", position: "Бухгалтер", teamId: 20000002, managerId: 10000002, city: "Москва", birthday: "19.07.1992", email: "a.belova@company.ru", telegram: nil),
        .init(id: 10000007, name: "Сергей Морозов", position: "Бухгалтер", teamId: 20000002, managerId: 10000002, city: "Москва", birthday: "30.10.1990", email: "s.morozov@company.ru", telegram: nil),
        
        // Юридический отдел
        .init(id: 10000008, name: "Игорь Лебедев", position: "Юрист", teamId: 20000003, managerId: 10000004, city: "Москва", birthday: "05.03.1991", email: "i.lebedev@company.ru", telegram: nil),
        .init(id: 10000009, name: "Татьяна Павлова", position: "Юрист", teamId: 20000003, managerId: 10000004, city: "Москва", birthday: "14.12.1993", email: "t.pavlova@company.ru", telegram: nil),
        
        // Лиды технического отдела
        .init(id: 10000010, name: "Алексей Смирнов", position: "Лид мобильной разработки", teamId: 20000004, managerId: 10000003, city: "Москва", birthday: "22.05.1987", email: "a.smirnov@company.ru", telegram: "@asmirnov"),
        .init(id: 10000011, name: "Павел Иванов", position: "Лид backend-разработки", teamId: 20000004, managerId: 10000003, city: "Москва", birthday: "09.08.1986", email: "p.ivanov@company.ru", telegram: "@pivanov"),
        .init(id: 10000012, name: "Наталья Козлова", position: "Лид frontend-разработки", teamId: 20000004, managerId: 10000003, city: "Москва", birthday: "17.01.1989", email: "n.kozlova@company.ru", telegram: "@nkozlova"),
        .init(id: 10000013, name: "Екатерина Васильева", position: "Лид дизайна", teamId: 20000004, managerId: 10000003, city: "Москва", birthday: "28.04.1990", email: "e.vasileva@company.ru", telegram: "@evas"),
        
        // Мобильная разработка
        .init(id: 10000014, name: "Иван Петров", position: "iOS-разработчик", teamId: 20000005, managerId: 10000010, city: "Москва", birthday: "11.06.1995", email: "i.petrov@company.ru", telegram: nil),
        .init(id: 10000015, name: "Мария Сидорова", position: "Android-разработчик", teamId: 20000005, managerId: 10000010, city: "Санкт-Петербург", birthday: "23.09.1996", email: "m.sidorova@company.ru", telegram: nil),
        .init(id: 10000016, name: "Артём Кузьмин", position: "iOS-разработчик", teamId: 20000005, managerId: 10000010, city: "Москва", birthday: "04.02.1994", email: "a.kuzmin@company.ru", telegram: nil),
        .init(id: 10000017, name: "Дарья Фёдорова", position: "Android-разработчик", teamId: 20000005, managerId: 10000010, city: "Казань", birthday: "16.11.1997", email: "d.fedorova@company.ru", telegram: nil),
        .init(id: 10000018, name: "Никита Орлов", position: "iOS-разработчик", teamId: 20000005, managerId: 10000010, city: "Москва", birthday: "29.07.1993", email: "n.orlov@company.ru", telegram: nil),
        .init(id: 10000019, name: "София Лебедева", position: "Android-разработчик", teamId: 20000005, managerId: 10000010, city: "Новосибирск", birthday: "07.01.1998", email: "s.lebedeva@company.ru", telegram: nil),
        
        // Backend-разработка
        .init(id: 10000020, name: "Сергей Волков", position: "Backend-разработчик", teamId: 20000006, managerId: 10000011, city: "Москва", birthday: "02.03.1992", email: "s.volkov@company.ru", telegram: nil),
        .init(id: 10000021, name: "Алина Морозова", position: "Backend-разработчик", teamId: 20000006, managerId: 10000011, city: "Москва", birthday: "18.08.1994", email: "a.morozova@company.ru", telegram: nil),
        .init(id: 10000022, name: "Кирилл Новиков", position: "Backend-разработчик", teamId: 20000006, managerId: 10000011, city: "Санкт-Петербург", birthday: "25.05.1991", email: "k.novikov@company.ru", telegram: nil),
        .init(id: 10000023, name: "Евгения Соколова", position: "Backend-разработчик", teamId: 20000006, managerId: 10000011, city: "Москва", birthday: "13.10.1996", email: "e.sokolova2@company.ru", telegram: nil),
        .init(id: 10000024, name: "Максим Попов", position: "Backend-разработчик", teamId: 20000006, managerId: 10000011, city: "Казань", birthday: "09.12.1993", email: "m.popov@company.ru", telegram: nil),
        .init(id: 10000025, name: "Виктория Егорова", position: "Backend-разработчик", teamId: 20000006, managerId: 10000011, city: "Москва", birthday: "21.04.1995", email: "v.egorova@company.ru", telegram: nil),
        .init(id: 10000026, name: "Андрей Зайцев", position: "Backend-разработчик", teamId: 20000006, managerId: 10000011, city: "Екатеринбург", birthday: "06.07.1990", email: "a.zaitsev@company.ru", telegram: nil),
        .init(id: 10000027, name: "Полина Ковалёва", position: "Backend-разработчик", teamId: 20000006, managerId: 10000011, city: "Москва", birthday: "15.09.1997", email: "p.kovaleva@company.ru", telegram: nil),
        .init(id: 10000028, name: "Роман Семёнов", position: "Backend-разработчик", teamId: 20000006, managerId: 10000011, city: "Москва", birthday: "28.02.1992", email: "r.semenov@company.ru", telegram: nil),
        
        // Frontend-разработка
        .init(id: 10000029, name: "Анна Крылова", position: "Frontend-разработчик", teamId: 20000007, managerId: 10000012, city: "Москва", birthday: "03.06.1994", email: "a.krylova@company.ru", telegram: nil),
        .init(id: 10000030, name: "Дмитрий Белов", position: "Frontend-разработчик", teamId: 20000007, managerId: 10000012, city: "Москва", birthday: "19.11.1991", email: "d.belov@company.ru", telegram: nil),
        .init(id: 10000031, name: "Елизавета Орлова", position: "Frontend-разработчик", teamId: 20000007, managerId: 10000012, city: "Санкт-Петербург", birthday: "27.03.1996", email: "e.orlova@company.ru", telegram: nil),
        .init(id: 10000032, name: "Илья Макаров", position: "Frontend-разработчик", teamId: 20000007, managerId: 10000012, city: "Москва", birthday: "08.08.1993", email: "i.makarov@company.ru", telegram: nil),
        .init(id: 10000033, name: "Ксения Фролова", position: "Frontend-разработчик", teamId: 20000007, managerId: 10000012, city: "Казань", birthday: "14.01.1998", email: "k.frolova@company.ru", telegram: nil),
        .init(id: 10000034, name: "Артём Никитин", position: "Frontend-разработчик", teamId: 20000007, managerId: 10000012, city: "Москва", birthday: "22.05.1990", email: "a.nikitin@company.ru", telegram: nil),
        .init(id: 10000035, name: "Мария Громова", position: "Frontend-разработчик", teamId: 20000007, managerId: 10000012, city: "Новосибирск", birthday: "30.09.1995", email: "m.gromova@company.ru", telegram: nil),
        .init(id: 10000036, name: "Павел Соловьёв", position: "Frontend-разработчик", teamId: 20000007, managerId: 10000012, city: "Москва", birthday: "11.12.1992", email: "p.solovyov@company.ru", telegram: nil),
        .init(id: 10000037, name: "Алина Захарова", position: "Frontend-разработчик", teamId: 20000007, managerId: 10000012, city: "Москва", birthday: "05.04.1997", email: "a.zakharova@company.ru", telegram: nil),
        .init(id: 10000038, name: "Никита Воробьёв", position: "Frontend-разработчик", teamId: 20000007, managerId: 10000012, city: "Екатеринбург", birthday: "17.07.1994", email: "n.vorobyov@company.ru", telegram: nil),
        .init(id: 10000039, name: "Дарья Медведева", position: "Frontend-разработчик", teamId: 20000007, managerId: 10000012, city: "Москва", birthday: "26.10.1996", email: "d.medvedeva@company.ru", telegram: nil),
        
        // Дизайн
        .init(id: 10000040, name: "Софья Романова", position: "UI/UX-дизайнер", teamId: 20000008, managerId: 10000013, city: "Москва", birthday: "09.03.1995", email: "s.romanova@company.ru", telegram: nil),
        .init(id: 10000041, name: "Александр Кузнецов", position: "Графический дизайнер", teamId: 20000008, managerId: 10000013, city: "Москва", birthday: "18.06.1991", email: "a.kuznetsov@company.ru", telegram: nil),
        .init(id: 10000042, name: "Вероника Лебедева", position: "UI/UX-дизайнер", teamId: 20000008, managerId: 10000013, city: "Санкт-Петербург", birthday: "24.11.1996", email: "v.lebedeva@company.ru", telegram: nil),
        .init(id: 10000043, name: "Михаил Соколов", position: "Дизайнер", teamId: 20000008, managerId: 10000013, city: "Москва", birthday: "02.02.1993", email: "m.sokolov@company.ru", telegram: nil),
        .init(id: 10000044, name: "Анастасия Попова", position: "UI/UX-дизайнер", teamId: 20000008, managerId: 10000013, city: "Казань", birthday: "13.08.1997", email: "a.popova@company.ru", telegram: nil)
    ]
    
    // MARK: - Команды
    static let teams: [TeamDTO] = [
        .init(
            id: 20000001,
            name: "Администрация",
            description: "Высшее руководство компании",
            mascotIcon: "building.2",
            leaderIds: [10000001],
            memberIds: [10000002, 10000003, 10000004]
        ),
        .init(
            id: 20000002,
            name: "Бухгалтерия",
            description: "Финансовый учёт и отчётность",
            mascotIcon: "chart.bar",
            leaderIds: [10000002],
            memberIds: [10000005, 10000006, 10000007]
        ),
        .init(
            id: 20000003,
            name: "Юридический отдел",
            description: "Правовое сопровождение деятельности компании",
            mascotIcon: "scale.3d",
            leaderIds: [10000004],
            memberIds: [10000008, 10000009]
        ),
        .init(
            id: 20000004,
            name: "Технический отдел",
            description: "Техническое руководство разработкой",
            mascotIcon: "gearshape.2",
            leaderIds: [10000003],
            memberIds: [10000010, 10000011, 10000012, 10000013]
        ),
        .init(
            id: 20000005,
            name: "Мобильная разработка",
            description: "Разработка iOS и Android приложений",
            mascotIcon: "iphone",
            leaderIds: [10000010],
            memberIds: [10000014, 10000015, 10000016, 10000017, 10000018, 10000019]
        ),
        .init(
            id: 20000006,
            name: "Backend-разработка",
            description: "Серверная разработка и API",
            mascotIcon: "server.rack",
            leaderIds: [10000011],
            memberIds: [10000020, 10000021, 10000022, 10000023, 10000024, 10000025, 10000026, 10000027, 10000028]
        ),
        .init(
            id: 20000007,
            name: "Frontend-разработка",
            description: "Разработка веб-интерфейсов",
            mascotIcon: "safari",
            leaderIds: [10000012],
            memberIds: [10000029, 10000030, 10000031, 10000032, 10000033, 10000034, 10000035, 10000036, 10000037, 10000038, 10000039]
        ),
        .init(
            id: 20000008,
            name: "Дизайн",
            description: "UI/UX и визуальный стиль продуктов",
            mascotIcon: "paintbrush",
            leaderIds: [10000013],
            memberIds: [10000040, 10000041, 10000042, 10000043, 10000044]
        )
    ]
    
    static let wallPosts: [WallPostDTO] = [
        .init(id: 30000001, tag: "Новости", title: "Запуск нового корпоративного портала", content: "Мы рады сообщить о запуске обновлённого мобильного приложения корпоративного портала. Теперь все сервисы компании доступны в одном месте.", company: "ООО \"Технологии\""),
        .init(id: 30000002, tag: "Мероприятия", title: "Корпоратив в эту пятницу", content: "Приглашаем всех сотрудников на ежегодный корпоратив. Начало в 19:00 в ресторане «Небо». Дресс-код — smart casual.", company: "ООО \"Технологии\""),
        .init(id: 30000003, tag: "Новости", title: "Обновление политик компании", content: "Ознакомьтесь с обновлёнными внутренними политиками. Особенно важны разделы по удалённой работе и информационной безопасности.", company: "ООО \"Технологии\""),
        .init(id: 30000004, tag: "Сезонное", title: "Летний график работы", content: "С 1 июня по 31 августа действует летний график: пятница — сокращённый день до 16:00.", company: "ООО \"Технологии\""),
        .init(id: 30000005, tag: "Новости", title: "Новый офис в Санкт-Петербурге", content: "Открыли второй офис в Санкт-Петербурге. Приглашаем коллег на экскурсию и welcome-встречу.", company: "ООО \"Технологии\""),
        .init(id: 30000006, tag: "Мероприятия", title: "Хакатон для разработчиков", content: "Внутренний хакатон состоится 15–16 ноября. Регистрация открыта до 10 ноября. Призы — ценные.", company: "ООО \"Технологии\""),
        .init(id: 30000007, tag: "Новости", title: "Результаты квартала", content: "Компания показала рост выручки на 18% по сравнению с прошлым кварталом. Спасибо всей команде!", company: "ООО \"Технологии\""),
        .init(id: 30000008, tag: "Сезонное", title: "Новогодний корпоратив", content: "Начинаем подготовку к новогоднему корпоративу. Голосуйте за формат и локацию в опросе.", company: "ООО \"Технологии\""),
        .init(id: 30000009, tag: "Новости", title: "Запуск программы менторства", content: "Стартует программа менторства для junior-специалистов. Если хотите стать ментором — напишите в HR.", company: "ООО \"Технологии\""),
        .init(id: 30000010, tag: "Мероприятия", title: "День донора", content: "15 декабря проводим День донора в офисе. Регистрация обязательна. Все доноры получают выходной.", company: "ООО \"Технологии\""),
        .init(id: 30000011, tag: "Новости", title: "Обновление системы бенефитов", content: "Расширили пакет бенефитов: добавили компенсацию спорта и онлайн-курсов. Подробности в личном кабинете.", company: "ООО \"Технологии\""),
        .init(id: 30000012, tag: "Сезонное", title: "График на майские праздники", content: "Опубликован график работы на майские праздники. Обратите внимание на переносы рабочих дней.", company: "ООО \"Технологии\""),
        .init(id: 30000013, tag: "Новости", title: "Победа в конкурсе «Лучший работодатель»", content: "Компания заняла 2-е место в рейтинге лучших работодателей в IT. Это общая заслуга!", company: "ООО \"Технологии\""),
        .init(id: 30000014, tag: "Мероприятия", title: "Встреча с CEO", content: "В четверг в 16:00 пройдёт открытая встреча с генеральным директором. Можно задать любые вопросы.", company: "ООО \"Технологии\""),
        .init(id: 30000015, tag: "Новости", title: "Запуск внутреннего маркетплейса", content: "Теперь можно заказывать корпоративный мерч через внутренний маркетплейс. Доставка в офис бесплатная.", company: "ООО \"Технологии\"")
    ]
    
    static let infoArticles: [InfoArticleDTO] = [
        .init(id: 40000001, title: "Как оформить отпуск", content: "Для оформления отпуска необходимо подать заявку в HR-портале не менее чем за 14 календарных дней. Заявка проходит согласование у непосредственного руководителя и HR. После одобрения вы получите уведомление."),
        .init(id: 40000002, title: "Правила удалённой работы", content: "Удалённая работа возможна по согласованию с руководителем. Необходимо быть на связи в рабочие часы (10:00–19:00), участвовать в ежедневных стендапах и ежедневно отчитываться о задачах в трекере."),
        .init(id: 40000003, title: "Корпоративные бенефиты", content: "Компания предоставляет ДМС (включая стоматологию), компенсацию спорта до 5 000 ₽ в месяц, оплату онлайн-курсов и английского языка, а также дополнительные дни отпуска за стаж."),
        .init(id: 40000004, title: "Как заказать справку", content: "Справки (2-НДФЛ, с места работы и др.) можно заказать через HR-портал. Срок изготовления — до 3 рабочих дней. Готовую справку можно забрать в офисе или получить по почте."),
        .init(id: 40000005, title: "Политика информационной безопасности", content: "Запрещено передавать рабочие данные на личные устройства и почту. Используйте только корпоративные инструменты. При утере устройства немедленно сообщите в IT-отдел."),
        .init(id: 40000006, title: "Как подключиться к корпоративному VPN", content: "Инструкция по подключению к VPN доступна в базе знаний. Для доступа нужен корпоративный аккаунт и установленное приложение. При проблемах обращайтесь в IT-поддержку."),
        .init(id: 40000007, title: "Процесс онбординга новых сотрудников", content: "В первый день вас встретит HR и проведёт экскурсию. В течение первой недели вы получите доступы, ноутбук и познакомитесь с командой. Ментор будет сопровождать вас первый месяц."),
        .init(id: 40000008, title: "Правила бронирования переговорных", content: "Переговорные бронируются через календарь. Максимальное время одной брони — 2 часа. Если встреча отменяется, освободите слот заранее."),
        .init(id: 40000009, title: "Компенсация обедов", content: "Компания компенсирует обеды в офисной столовой или партнёрских кафе. Лимит — 500 ₽ в день. Компенсация начисляется автоматически при оплате корпоративной картой."),
        .init(id: 40000010, title: "Как сообщить об ошибке в системе", content: "Если вы обнаружили баг в корпоративных системах, создайте тикет в Service Desk. Укажите шаги воспроизведения и скриншоты. Критичные инциденты решаются в приоритетном порядке."),
        .init(id: 40000011, title: "Политика использования корпоративной техники", content: "Ноутбуки и телефоны выдаются под расписку. Запрещено устанавливать нелицензионное ПО. При увольнении технику необходимо вернуть в IT-отдел в исправном состоянии."),
        .init(id: 40000012, title: "Как получить доступ к репозиториям", content: "Доступ к Git-репозиториям выдаёт тимлид. После согласования вы получите приглашение на корпоративную почту. Используйте SSH-ключи для аутентификации."),
        .init(id: 40000013, title: "Правила командировок", content: "Командировки оформляются через заявку в HR. Суточные и проживание компенсируются по утверждённым лимитам. Отчёт о командировке нужно сдать в течение 3 дней после возвращения."),
        .init(id: 40000014, title: "Программа рекомендаций", content: "Если вы порекомендуете кандидата, который пройдёт испытательный срок, вы получите бонус. Размер бонуса зависит от грейда позиции. Подробности у HR."),
        .init(id: 40000015, title: "Как работать с корпоративным мессенджером", content: "Основной канал коммуникации — корпоративный мессенджер. Важные объявления дублируются на почту. Не используйте личные мессенджеры для рабочей переписки.")
    ]
}
