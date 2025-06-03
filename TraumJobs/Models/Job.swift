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
    var salary: Double
    var isFavorite: Bool
    
    init(title: String, salary: Double, isFavorite: Bool = false) {
        self.title = title
        self.salary = salary
        self.isFavorite = isFavorite
    }
}
