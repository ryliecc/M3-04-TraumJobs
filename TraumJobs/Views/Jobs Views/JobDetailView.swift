//
//  JobDetailView.swift
//  TraumJobs
//
//  Created by Rylie Castell on 05.06.25.
//

import SwiftUI

struct JobDetailView: View {
    var job: Job
    @Binding var isVisible: Bool
    var body: some View {
        VStack {
            Text(job.title)
            Text("Jahresgehalt: \(job.salary.formatted())€")
            Text("Benötigte Skills:")
            VStack {
                ForEach(job.skills, id: \.id) { skill in
                    Text("\(skill.title) - \(skill.level.rawValue)")
                }
            }
            Text("Weitere Details:\n\(job.details)")
                .multilineTextAlignment(.leading)
            Button("Schließen") {
                isVisible = false
            }
        }
    }
}

#Preview {
    @Previewable var job: Job = Job(title: "iOS Developer", details: "Junior Stelle full remote", salary: 40000, skills: [Skill(title: "SwiftUI", level: .medium), Skill(title: "React", level: .low)], isFavorite: true)
    @Previewable @State var isVisible: Bool = true
    JobDetailView(job: job, isVisible: $isVisible)
}
