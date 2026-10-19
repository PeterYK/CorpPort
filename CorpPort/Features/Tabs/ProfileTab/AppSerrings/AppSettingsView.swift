//
//  AppSettingsView.swift
//  CorpPort
//
//  Created by Peter Kozlov on 19.10.2026.
//

import SwiftUI

struct AppSettingsView: View {
    @Environment(RootStore.self) var rootStore
    
    var body: some View {
        @Bindable var store = rootStore.settingsStore
        
        List {
            Section("Уведомления") {
                Toggle("Напоминание о ТРЗ", isOn: Binding(
                    get: { store.isDailyReminderEnabled },
                    set: { store.dispatch(.toggleDailyReminder($0)) }
                ))
                
                if store.isDailyReminderEnabled {
                    DatePicker(
                        "Время",
                        selection: Binding(
                            get: { store.reminderTime },
                            set: { store.dispatch(.setReminderTime($0)) }
                        ),
                        displayedComponents: .hourAndMinute
                    )
                }
                
                Button("Открыть настройки уведомлений") {
                    store.dispatch(.openNotificationSettings)
                }
            }
        }
        .navigationTitle("Настройки")
        .navigationBarTitleDisplayMode(.inline)
        .safeAreaInset(edge: .bottom) {
            Text("Версия: \(store.appVersion)")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
        }
    }
}
