//
//  SkillsView.swift
//  TraumJobs
//
//  Created by Rylie Castell on 02.06.25.
//

import SwiftUI
import SwiftData

struct SkillsView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Skill.title) private var skills: [Skill]
    @State var sheetIsVisible: Bool = false
    
    var body: some View {
        VStack {
            Text("Skills")
                .font(.headline)
            Button("Neuen Skill hinzufügen") {
                sheetIsVisible = true
            }
            List {
                ForEach(skills) { skill in
                    Text(skill.title)
                }
            }
        }
        .sheet(isPresented: $sheetIsVisible) {
            SkillAddView(sheetIsVisible: $sheetIsVisible)
        }
    }
}

#Preview {
    SkillsView()
}
