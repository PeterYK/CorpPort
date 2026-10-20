//
//  AppSettingsActions.swift
//  CorpPort
//
//  Created by Peter Kozlov on 19.10.2026.
//

import Foundation

enum AppSettingsActions {
    case toggleDailyReminder(Bool)
    case setReminderTime(Date)
    case openNotificationSettings
    case toggleSystemTheme(Bool)
    case toggleDarkMode(Bool)
}
