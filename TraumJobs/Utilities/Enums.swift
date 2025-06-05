//
//  Enums.swift
//  TraumJobs
//
//  Created by Rylie Castell on 02.06.25.
//

import Foundation

enum TabSelection {
    case dashboard
    case jobs
    case favorites
    case skills
}

enum AppLanguage: String, CaseIterable {
    case german = "Deutsch"
    case english = "Englisch"
    case japanese = "Japanisch"
}

enum ThemeMode: String, CaseIterable {
    case light = "Light"
    case dark = "Dark"
    case system = "System"
}

enum SkillLevel: String, CaseIterable, Codable {
    case veryLow = "sehr niedrig"
    case low = "niedrig"
    case medium = "mittel"
    case high = "hoch"
    case veryHigh = "sehr hoch"
}
