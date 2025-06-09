//
//  FavoritesView.swift
//  TraumJobs
//
//  Created by Rylie Castell on 02.06.25.
//

import SwiftData
import SwiftUI

struct FavoritesView: View {
    @Query(
        filter: #Predicate<Job> { job in
            job.isFavorite
        },
        sort: \Job.title
    ) var jobs: [Job]

    var body: some View {
        VStack {
            Text("Favoriten")
                .font(Fonts.listHeadline)
            if jobs.isEmpty {
                Text("Noch keine Favoriten...")
                Spacer()
            } else {
                List {
                    ForEach(jobs) { job in
                        JobListItemView(job: job)
                            .listRowSeparator(.hidden)
                    }
                }
                .listStyle(.plain)
            }
        }
        .padding()
    }
}

#Preview {
    FavoritesView()
}
