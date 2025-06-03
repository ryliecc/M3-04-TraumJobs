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
    @Query private var jobs: [Job]
    
    @State var sheetIsVisible: Bool = false
    var body: some View {
        VStack {
            Text("Jobs")
                .font(.headline)
            Button("Neuen Job hinzufügen") {
                sheetIsVisible = true
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
