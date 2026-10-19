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
    
    var body: some View {
        Text("\(Calendar.current.component(.day, from: date))")
            .frame(width: 36, height: 36)
            .background(
                Circle()
                    .fill(backgroundColor)
            )
            .foregroundStyle(isSelected ? .white : .primary)
            .onTapGesture(perform: onTap)
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
