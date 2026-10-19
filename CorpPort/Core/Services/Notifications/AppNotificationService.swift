//
//  AppNotificationService.swift
//  CorpPort
//
//  Created by Peter Kozlov on 19.10.2026.
//

import Foundation
import UserNotifications

final class AppNotificationService: NSObject, NotificationService, UNUserNotificationCenterDelegate {
    
    var onTRZNotificationTapped: (() -> Void)?
    
    override init() {
        super.init()
        UNUserNotificationCenter.current().delegate = self
    }
    
    func requestPermission() async -> Bool {
        do {
            return try await UNUserNotificationCenter.current()
                .requestAuthorization(options: [.alert, .sound, .badge])
        } catch {
            return false
        }
    }
    
    func scheduleDailyTRZReminder(hour: Int, minute: Int) {
        let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: ["daily_trz_reminder"])
        
        let content = UNMutableNotificationContent()
        content.title = "Трудозатраты"
        content.body = "Заполни ТРЗ"
        content.sound = .default
        
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: "daily_trz_reminder", content: content, trigger: trigger)
        
        center.add(request)
    }
    
    func cancelDailyTRZReminder() {
        UNUserNotificationCenter.current()
            .removePendingNotificationRequests(withIdentifiers: ["daily_trz_reminder"])
    }
    
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: @escaping () -> Void
    ) {
        let identifier = response.notification.request.identifier
        
        if identifier == "daily_trz_reminder" || identifier == "test_trz" {
            onTRZNotificationTapped?()
        }
        
        completionHandler()
    }
    
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        completionHandler([.banner, .sound])
    }
}
