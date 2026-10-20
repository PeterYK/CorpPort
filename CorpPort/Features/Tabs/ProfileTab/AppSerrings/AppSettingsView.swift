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
        List {
            notificationSection()
            appThemeSection()
        }
        .navigationTitle("Настройки")
        .navigationBarTitleDisplayMode(.inline)
        .safeAreaInset(edge: .bottom) {
            Text("Версия: \(rootStore.settingsStore.appVersion)")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
        }
    }
}

extension AppSettingsView {
    private func notificationSection() -> some View {
        Section("Уведомления") {
            Toggle("Напоминание о ТРЗ", isOn: Binding(
                get: { rootStore.settingsStore.isDailyReminderEnabled },
                set: { rootStore.settingsStore.dispatch(.toggleDailyReminder($0)) }
            ))
            
            if rootStore.settingsStore.isDailyReminderEnabled {
                DatePicker(
                    "Время",
                    selection: Binding(
                        get: { rootStore.settingsStore.reminderTime },
                        set: { rootStore.settingsStore.dispatch(.setReminderTime($0)) }
                    ),
                    displayedComponents: .hourAndMinute
                )
            }
            
            Button("Открыть настройки уведомлений") {
                rootStore.settingsStore.dispatch(.openNotificationSettings)
            }
        }
    }
    
    private func appThemeSection() -> some View {
        Section("Оформление") {
            Toggle("Системная тема", isOn: Binding(
                get: { rootStore.settingsStore.useSystemTheme },
                set: { rootStore.settingsStore.dispatch(.toggleSystemTheme($0)) }
            ))
            
            if !rootStore.settingsStore.useSystemTheme {
                Toggle("Тёмная тема", isOn: Binding(
                    get: { rootStore.settingsStore.isDarkMode },
                    set: { rootStore.settingsStore.dispatch(.toggleDarkMode($0)) }
                ))
            }
        }
    }
}
