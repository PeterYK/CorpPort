//
//  DayCell.swift
//  CorpPort
//
//  Created by Peter Kozlov on 19.10.2026.
//

import SwiftUI

struct DayCell: View {
    let date: Date
    let isSelected: Bool
    let isToday: Bool
    let isMissed: Bool
    let onTap: () -> Void
    
    private var isFuture: Bool {
        Calendar.current.startOfDay(for: date) > Calendar.current.startOfDay(for: Date())
    }
    
    private var isWeekend: Bool {
        let weekday = Calendar.current.component(.weekday, from: date)
        return weekday == 1 || weekday == 7
    }
    
    var body: some View {
        Text("\(Calendar.current.component(.day, from: date))")
            .frame(width: 36, height: 36)
            .background(Circle().fill(backgroundColor))
            .foregroundStyle(isFuture || isWeekend ? Color.secondary : (isSelected ? Color.white : Color.primary))
            .opacity(isFuture ? 0.4 : 1)
            .onTapGesture {
                if !isFuture && !isWeekend {
                    onTap()
                }
            }
    }
    private var backgroundColor: Color {
        if isSelected {
            return .blue
        } else if isMissed {
            return .orange.opacity(0.7)
        } else if isToday {
            return .blue.opacity(0.2)
        } else {
            return .clear
        }
    }
}
