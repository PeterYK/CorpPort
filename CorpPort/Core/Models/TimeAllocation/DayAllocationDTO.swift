//
//  DayAllocationDTO.swift
//  CorpPort
//
//  Created by Peter Kozlov on 19.10.2026.
//

import SwiftUI

struct DayAllocationDTO: Codable {
    let date: String
    let allocations: [AllocationDTO]
}
