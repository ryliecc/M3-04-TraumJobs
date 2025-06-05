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
    @Relationship(inverse: \Skill.jobs)
    var skills: [Skill]
    var isFavorite: Bool
    
    init(title: String, details: String, salary: Int, skills: [Skill], isFavorite: Bool = false) {
        self.title = title
        self.details = details
        self.salary = salary
        self.skills = skills
        self.isFavorite = isFavorite
    }
}
