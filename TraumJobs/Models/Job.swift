//
//  Job.swift
//  TraumJobs
//
//  Created by Rylie Castell on 03.06.25.
//

import Foundation
import SwiftData

@Model
class Job {
    var title: String
    var details: String
    var salary: Int
    var isFavorite: Bool
    
    init(title: String, details: String, salary: Int, isFavorite: Bool = false) {
        self.title = title
        self.details = details
        self.salary = salary
        self.isFavorite = isFavorite
    }
}
