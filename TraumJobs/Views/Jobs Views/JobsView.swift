//
//  JobsView.swift
//  TraumJobs
//
//  Created by Rylie Castell on 02.06.25.
//

import SwiftUI
import SwiftData

struct JobsView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Job.title) private var jobs: [Job]
    
    @State var sheetIsVisible: Bool = false
    @State var detailsIsVisible: Bool = false
    var body: some View {
        VStack {
            Text("Jobs")
                .font(.headline)
            Button("Neuen Job hinzufügen") {
                sheetIsVisible = true
            }
            List {
                ForEach(jobs) { job in
                    JobListItemView(job: job)
                        .swipeActions {
                            Button(role: .destructive) {
                                context.delete(job)
                            } label: {
                                Label("Löschen", systemImage: "trash")
                            }
                            Button {
                                job.isFavorite.toggle()
                            } label: {
                                Label(job.isFavorite ? "Entfavorisieren" : "Favorisieren", systemImage: "star")
                            }
                        }
                        .onTapGesture {
                            detailsIsVisible = true
                        }
                        .sheet(isPresented: $detailsIsVisible) {
                            JobDetailView(job: job, isVisible: $detailsIsVisible)
                        }
                }
            }
        }
        .sheet(isPresented: $sheetIsVisible) {
            JobAddView(sheetIsVisible: $sheetIsVisible)
        }
    }
}

#Preview {
    JobsView()
}
