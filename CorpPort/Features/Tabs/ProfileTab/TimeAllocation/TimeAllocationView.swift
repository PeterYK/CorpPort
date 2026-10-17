//
//  TimeAllocationView.swift
//  CorpPort
//
//  Created by Peter Kozlov on 15.10.2026.
//

import SwiftUI

import SwiftUI

struct TimeAllocationView: View {
    @Environment(AppState.self) var appState
    @State private var selectedDate = Date()
    @State private var currentMonth = Date()
    @State private var showAddProject = false
    
    // Избранные проекты (демо)
    @State private var favoriteProjects: [ProjectAllocation] = [
        ProjectAllocation(name: "Мобильное приложение", hours: 40),
        ProjectAllocation(name: "Внутренний портал", hours: 30)
    ]
    
    // Все доступные проекты
    private let allProjects = [
        "Мобильное приложение",
        "Внутренний портал",
        "Аналитика",
        "Инфраструктура",
        "Поддержка"
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Календарь месяца
                monthCalendar
                
                // Выбранная дата со стрелками
                selectedDateControl
                
                // Блок проектов
                projectsBlock
                
                // Кнопка добавить проект
                Button {
                    showAddProject = true
                } label: {
                    Label("Добавить проект", systemImage: "plus")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .padding(.horizontal)
            }
            .padding(.vertical)
        }
        .navigationTitle("Трудозатраты")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showAddProject) {
            AddProjectSheet(
                availableProjects: allProjects.filter { name in
                    !favoriteProjects.contains { $0.name == name }
                },
                onSelect: { name in
                    favoriteProjects.append(ProjectAllocation(name: name, hours: 0))
                }
            )
        }
    }
    
    // MARK: - Календарь
    private var monthCalendar: some View {
        VStack(spacing: 12) {
            // Заголовок месяца
            HStack {
                Button {
                    changeMonth(by: -1)
                } label: {
                    Image(systemName: "chevron.left")
                }
                
                Spacer()
                
                Text(monthYearString(from: currentMonth))
                    .font(.headline)
                
                Spacer()
                
                Button {
                    changeMonth(by: 1)
                } label: {
                    Image(systemName: "chevron.right")
                }
            }
            .padding(.horizontal)
            
            // Сетка дней
            let days = daysInMonth(for: currentMonth)
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 8) {
                ForEach(["Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс"], id: \.self) { day in
                    Text(day)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                
                ForEach(days, id: \.self) { date in
                    if let date {
                        let isSelected = Calendar.current.isDate(date, inSameDayAs: selectedDate)
                        let isToday = Calendar.current.isDateInToday(date)
                        let isMissed = isMissedDate(date)   // ← новая проверка
                        
                        Text("\(Calendar.current.component(.day, from: date))")
                            .frame(width: 36, height: 36)
                            .background(
                                Circle()
                                    .fill(backgroundColor(isSelected: isSelected, isToday: isToday, isMissed: isMissed))
                            )
                            .foregroundStyle(isSelected ? .white : .primary)
                            .onTapGesture {
                                selectedDate = date
                            }
                    } else {
                        Text("")
                            .frame(width: 36, height: 36)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
    // MARK: - Управление выбранной датой
    private var selectedDateControl: some View {
        HStack {
            Button {
                changeSelectedDate(by: -1)
            } label: {
                Image(systemName: "chevron.left")
            }
            
            Spacer()
            
            Text(selectedDate.formatted(date: .long, time: .omitted))
                .font(.headline)
            
            Spacer()
            
            Button {
                changeSelectedDate(by: 1)
            } label: {
                Image(systemName: "chevron.right")
            }
        }
        .padding(.horizontal)
        .padding(.vertical)
    }
    
    // MARK: - Блок проектов
    private var projectsBlock: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Избранные проекты")
                .font(.headline)
                .padding(.horizontal)
            
            ForEach($favoriteProjects) { $project in
                HStack {
                    Text(project.name)
                    Spacer()
                    TextField("0", value: $project.hours, format: .number)
                        .keyboardType(.numberPad)
                        .frame(width: 60)
                        .textFieldStyle(.roundedBorder)
                        .multilineTextAlignment(.trailing)
                    Text("%")
                        .foregroundStyle(.secondary)
                }
                .padding(.horizontal)
            }
        }
    }
    
    // MARK: - Вспомогательные методы
    private func changeMonth(by value: Int) {
        if let newMonth = Calendar.current.date(byAdding: .month, value: value, to: currentMonth) {
            currentMonth = newMonth
        }
    }
    
    private func changeSelectedDate(by value: Int) {
        if let newDate = Calendar.current.date(byAdding: .day, value: value, to: selectedDate) {
            selectedDate = newDate
            currentMonth = newDate
        }
    }
    
    private func monthYearString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "LLLL yyyy"
        return formatter.string(from: date).capitalized
    }
    
    private func daysInMonth(for date: Date) -> [Date?] {
        let calendar = Calendar.current
        guard let range = calendar.range(of: .day, in: .month, for: date),
              let firstDay = calendar.date(from: calendar.dateComponents([.year, .month], from: date)) else {
            return []
        }
        
        let firstWeekday = calendar.component(.weekday, from: firstDay)
        let offset = (firstWeekday + 5) % 7 // Понедельник = 0
        
        var days: [Date?] = Array(repeating: nil, count: offset)
        
        for day in range {
            if let date = calendar.date(byAdding: .day, value: day - 1, to: firstDay) {
                days.append(date)
            }
        }
        
        return days
    }
    
    // Проверка, является ли дата пропущенной (демо-логика)
    private func isMissedDate(_ date: Date) -> Bool {
        // Пример: считаем пропущенными рабочие дни в прошлом без заполнения
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let checkDate = calendar.startOfDay(for: date)
        
        // Только прошлые дни
        guard checkDate < today else { return false }
        
        // Только будни (пн–пт)
        let weekday = calendar.component(.weekday, from: date)
        guard weekday != 1 && weekday != 7 else { return false }
        
        // Здесь потом будет проверка, заполнен ли ТРЗ за этот день
        // Пока для демо: каждый второй день считаем пропущенным
        let day = calendar.component(.day, from: date)
        return day % 2 == 0
    }

    // Цвет фона дня
    private func backgroundColor(isSelected: Bool, isToday: Bool, isMissed: Bool) -> Color {
        if isSelected {
            return .blue
        } else if isMissed {
            return .orange.opacity(0.7)   // ← цвет пропущенных дней
        } else if isToday {
            return .blue.opacity(0.2)
        } else {
            return .clear
        }
    }
}
