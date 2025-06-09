//
//  JobsView.swift
//  TraumJobs
//
//  Created by Rylie Castell on 02.06.25.
//

import SwiftData
import SwiftUI

struct JobsView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Job.title) private var jobs: [Job]

    @State var sheetIsVisible: Bool = false
    @State var detailsIsVisible: Bool = false
    var body: some View {
        ZStack {
            VStack {
                Text("Jobs")
                    .font(Fonts.listHeadline)
                if jobs.isEmpty {
                    Text("Noch keine Jobs gespeichert...")
                    Spacer()
                } else {
                    List {
                        ForEach(jobs) { job in
                            JobListItemView(job: job)
                                .listRowSeparator(.hidden)
                                .swipeActions {
                                    Button(role: .destructive) {
                                        context.delete(job)
                                    } label: {
                                        Label("Löschen", systemImage: "trash")
                                    }
                                    Button {
                                        job.isFavorite.toggle()
                                    } label: {
                                        Label(
                                            job.isFavorite
                                                ? "Entfavorisieren"
                                                : "Favorisieren",
                                            systemImage: "star"
                                        )
                                    }
                                }
                                .onTapGesture {
                                    detailsIsVisible = true
                                }
                                .sheet(isPresented: $detailsIsVisible) {
                                    JobDetailView(
                                        job: job,
                                        isVisible: $detailsIsVisible
                                    )
                                }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .padding()
            .sheet(isPresented: $sheetIsVisible) {
                JobAddView(sheetIsVisible: $sheetIsVisible)
            }

            Button {
                sheetIsVisible = true
            } label: {
                Image(systemName: "plus")
            }
            .font(.system(size: 32))
            .padding()
            .foregroundColor(.white)
            .background(
                RoundedRectangle(cornerRadius: 8).fill(Color("PrimaryColor"))
            )
            .position(x: 356, y: 584)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    JobsView()
}
