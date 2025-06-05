//
//  Skill.swift
//  TraumJobs
//
//  Created by Rylie Castell on 05.06.25.
//

import Foundation
import SwiftData

@Model
class Skill {
    var title: String
    var level: SkillLevel
    var jobs: [Job] = []
    
    init(title: String, level: SkillLevel) {
        self.title = title
        self.level = level
    }
}
