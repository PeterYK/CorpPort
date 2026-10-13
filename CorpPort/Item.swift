//
//  Item.swift
//  CorpPort
//
//  Created by Peter Kozlov on 13.10.2026.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
