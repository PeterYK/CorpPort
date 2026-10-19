//
//  SelectedDateControl.swift
//  CorpPort
//
//  Created by Peter Kozlov on 19.10.2026.
//

import SwiftUI

struct SelectedDateControl: View {
    let selectedDate: Date
    let onChange: (Int) -> Void
    
    private var dayNumber: Int {
        return Calendar.current.component(.weekday, from: selectedDate)
    }
    
    private var isFuture: Bool {
        Calendar.current.startOfDay(for: selectedDate) >= Calendar.current.startOfDay(for: Date())
    }

    var body: some View {
        HStack {
            Button {
                onChange(dayNumber != 2 ? -1 : -3)
            } label: {
                Image(systemName: "chevron.left")
            }
            
            Spacer()
            
            Text(selectedDate.formatted(date: .long, time: .omitted))
                .font(.headline)
            
            Spacer()
            
            Button {
                onChange(dayNumber != 6 ? 1 : 3)
            } label: {
                Image(systemName: "chevron.right")
            }
            .disabled(isFuture)
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}
