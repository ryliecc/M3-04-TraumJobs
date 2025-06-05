//
//  JobListItemView.swift
//  TraumJobs
//
//  Created by Rylie Castell on 04.06.25.
//

import SwiftUI

struct JobListItemView: View {
    var job: Job
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: job.isFavorite ? "star.fill" : "star")
                .font(.system(size: 24))
            VStack(alignment: .center) {
                Text(job.title)
                    .font(.title3)
                    .bold()
                    .multilineTextAlignment(.center)
                Text("\(job.salary.formatted())€")
            }
            Text(job.details)
                .multilineTextAlignment(.leading)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(RoundedRectangle(cornerRadius: 8).fill(.yellow))
    }
}

#Preview {
    @Previewable var job = Job(title: "iOS Developer", details: "Junior Entwickler gesucht mit Web Dev Erfahrung", salary: 40000, skills: [Skill(title: "SwiftUI", level: .high), Skill(title: "React", level: .medium)], isFavorite: true)
    
    JobListItemView(job: job)
}
