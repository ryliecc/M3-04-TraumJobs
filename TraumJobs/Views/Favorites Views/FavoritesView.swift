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
        }
    ) var jobs: [Job]
    
    var body: some View {
        Text("Favoriten")
            .font(.headline)
        List {
            ForEach(jobs) { job in
                Text(job.title)
            }
        }
    }
}

#Preview {
    FavoritesView()
}
