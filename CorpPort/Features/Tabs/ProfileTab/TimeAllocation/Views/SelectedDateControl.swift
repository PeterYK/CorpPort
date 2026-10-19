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
    
    var body: some View {
        HStack {
            Button {
                onChange(-1)
            } label: {
                Image(systemName: "chevron.left")
            }
            
            Spacer()
            
            Text(selectedDate.formatted(date: .long, time: .omitted))
                .font(.headline)
            
            Spacer()
            
            Button {
                onChange(1)
            } label: {
                Image(systemName: "chevron.right")
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}
