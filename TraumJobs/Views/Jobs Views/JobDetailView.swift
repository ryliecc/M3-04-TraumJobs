//
//  JobDetailView.swift
//  TraumJobs
//
//  Created by Rylie Castell on 05.06.25.
//

import SwiftUI
import SwiftData

struct JobDetailView: View {
    @Environment(\.modelContext) private var context
    
    var job: Job
    @Binding var isVisible: Bool
    @State var showDeleteAlert: Bool = false
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text(job.title)
                        .font(Fonts.listItemTitle)
                    Text("Jahresgehalt: \(job.salary.formatted())€")
                    VStack {
                        Text("Benötigte Skills:")
                            .underline()
                        ForEach(job.skills, id: \.id) { skill in
                            Text("\(skill.title) - \(skill.level.rawValue)")
                        }
                    }
                    Text("Weitere Details:\n\(job.details)")
                        .multilineTextAlignment(.leading)
                }
                .frame(maxWidth: .infinity)
                .font(Fonts.listItemText)
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 80)
            Button {
                showDeleteAlert = true
            } label: {
                Image(systemName: "trash")
                    .font(.system(size: 26))
                    .padding()
                    .foregroundColor(.white)
                    .background(RoundedRectangle(cornerRadius: 8).fill(Color("PrimaryColor")))
            }
            .position(x: 360, y: 680)
            .alert("Eintrag löschen", isPresented: $showDeleteAlert) {
                Button("Abbrechen", role: .cancel) {}
                Button("Löschen") {
                    context.delete(job)
                    isVisible = false
                }
            }
            Button {
                isVisible = false
            } label: {
                Image(systemName: "xmark.app")
                    .font(.system(size: 32))
                    .padding(12)
                    .foregroundColor(.white)
                    .background(RoundedRectangle(cornerRadius: 8).fill(Color("SecondaryColor")))
            }
            .position(x: 48, y: 40)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    @Previewable var job: Job = Job(title: "iOS Developer", details: "Junior Stelle full remote", salary: 40000, skills: [Skill(title: "SwiftUI", level: .medium), Skill(title: "React", level: .low)], isFavorite: true)
    @Previewable @State var isVisible: Bool = true
    JobDetailView(job: job, isVisible: $isVisible)
}
