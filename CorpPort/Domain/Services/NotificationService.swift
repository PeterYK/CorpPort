//
//  NotificationService.swift
//  CorpPort
//
//  Created by Peter Kozlov on 19.10.2026.
//

import Foundation

protocol NotificationService {
    var onTRZNotificationTapped: (() -> Void)? { get set }
    
    func requestPermission() async -> Bool
    func scheduleDailyTRZReminder(hour: Int, minute: Int)
    func cancelDailyTRZReminder()
}
