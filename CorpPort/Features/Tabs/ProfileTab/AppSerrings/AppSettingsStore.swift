//
//  AppSettingsStore.swift
//  CorpPort
//
//  Created by Peter Kozlov on 19.10.2026.
//

import SwiftUI

@Observable
final class AppSettingsStore {
    private let notificationService: NotificationService
    private let reminderTimeKey = "trz_reminder_time"
    
    var isDailyReminderEnabled = false
    var reminderTime: Date {
        didSet {
            saveReminderTime()
        }
    }
    
    var appVersion: String {
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "—"
        let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String
        if let build {
            return "\(version) (\(build))"
        }
        return version
    }
    
    init(notificationService: NotificationService) {
        self.notificationService = notificationService
        if let saved = UserDefaults.standard.object(forKey: reminderTimeKey) as? Date {
            self.reminderTime = saved
        } else {
            self.reminderTime = Calendar.current.date(from: DateComponents(hour: 18, minute: 0)) ?? Date()
        }
        
        checkCurrentStatus()
    }
    
    func dispatch(_ action: AppSettingsActions) {
        switch action {
        case .toggleDailyReminder(let isOn):
            if isOn {
                Task {
                    let granted = await requestPermission()
                    await MainActor.run {
                        isDailyReminderEnabled = granted
                        if granted {
                            updateReminder()
                        }
                    }
                }
            } else {
                isDailyReminderEnabled = false
                notificationService.cancelDailyTRZReminder()
            }
        case .setReminderTime(let date):
            reminderTime = date
            if isDailyReminderEnabled {
                updateReminder()
            }
            
        case .openNotificationSettings:
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url)
            }
        }
    }
}

extension AppSettingsStore {
    
    private func saveReminderTime() {
        UserDefaults.standard.set(reminderTime, forKey: reminderTimeKey)
    }
    
    private func updateReminder() {
        if isDailyReminderEnabled {
            let components = Calendar.current.dateComponents([.hour, .minute], from: reminderTime)
            notificationService.scheduleDailyTRZReminder(hour: components.hour ?? 18, minute: components.minute ?? 0)
        } else {
            notificationService.cancelDailyTRZReminder()
        }
    }
    
    private func checkCurrentStatus() {
        UNUserNotificationCenter.current().getPendingNotificationRequests { requests in
            DispatchQueue.main.async {
                self.isDailyReminderEnabled = requests.contains { $0.identifier == "daily_trz_reminder" }
            }
        }
    }
    
    private func requestPermission() async -> Bool {
        let center = UNUserNotificationCenter.current()
        
        let settings = await center.notificationSettings()
        
        switch settings.authorizationStatus {
        case .notDetermined:
            do {
                return try await center.requestAuthorization(options: [.alert, .sound, .badge])
            } catch {
                return false
            }
        case .authorized, .provisional, .ephemeral:
            return true
        default:
            return false
        }
    }
}
