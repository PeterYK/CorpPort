//
//  MonthCalendarView.swift
//  CorpPort
//
//  Created by Peter Kozlov on 19.10.2026.
//

import SwiftUI

struct MonthCalendarView: View {
    let currentMonth: Date
    let selectedDate: Date
    let onMonthChange: (Int) -> Void
    let onDateSelect: (Date) -> Void
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Button {
                    onMonthChange(-1)
                } label: {
                    Image(systemName: "chevron.left")
                }
                
                Spacer()
                
                Text(monthYearString(from: currentMonth))
                    .font(.headline)
                
                Spacer()
                
                Button {
                    onMonthChange(1)
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
                        DayCell(
                            date: date,
                            isSelected: Calendar.current.isDate(date, inSameDayAs: selectedDate),
                            isToday: Calendar.current.isDateInToday(date),
                            isMissed: isMissedDate(date)
                        ) {
                            onDateSelect(date)
                        }
                    } else {
                        Color.clear
                            .frame(width: 36, height: 36)
                    }
                }
            }
            .padding(.horizontal)
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
        let offset = (firstWeekday + 5) % 7
        
        var days: [Date?] = Array(repeating: nil, count: offset)
        
        for day in range {
            if let d = calendar.date(byAdding: .day, value: day - 1, to: firstDay) {
                days.append(d)
            }
        }
        return days
    }
    
    private func isMissedDate(_ date: Date) -> Bool {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let check = calendar.startOfDay(for: date)
        
        guard check < today else { return false }
        
        let weekday = calendar.component(.weekday, from: date)
        guard weekday != 1 && weekday != 7 else { return false }
        
        return calendar.component(.day, from: date) % 2 == 0
    }
}
