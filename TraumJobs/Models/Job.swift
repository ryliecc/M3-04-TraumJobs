//
//  Job.swift
//  TraumJobs
//
//  Created by Rylie Castell on 03.06.25.
//

import Foundation
import SwiftData

@Model
class Job: Identifiable {
    var id = UUID()
    var title: String
    var details: String
    var salary: Double
    var isFavorite: Bool
    
    init(title: String, details: String, salary: Double, isFavorite: Bool = false) {
        self.title = title
        self.details = details
        self.salary = salary
        self.isFavorite = isFavorite
    }
}
