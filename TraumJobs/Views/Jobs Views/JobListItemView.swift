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
                .font(.system(size: 40))
                .foregroundColor(
                    job.isFavorite ? Color("PrimaryColor") : .white
                )
            VStack(alignment: .center, spacing: 8) {
                Text(job.title)
                    .font(Fonts.listItemTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                Text("\(job.salary.formatted())€")
                    .font(Fonts.listItemText)
            }
            .frame(maxWidth: .infinity)
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 8).fill(Color("SecondaryColor"))
        )
    }
}

#Preview {
    @Previewable var job = Job(
        title: "iOS Developer",
        details: "Junior Entwickler gesucht mit Web Dev Erfahrung",
        salary: 40000,
        skills: [
            Skill(title: "SwiftUI", level: .high),
            Skill(title: "React", level: .medium),
        ],
        isFavorite: true
    )

    JobListItemView(job: job)
}
