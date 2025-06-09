//
//  SkillsView.swift
//  TraumJobs
//
//  Created by Rylie Castell on 02.06.25.
//

import SwiftData
import SwiftUI

struct SkillsView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Skill.title) private var skills: [Skill]
    @State var sheetIsVisible: Bool = false

    var body: some View {
        ZStack {
            VStack {
                Text("Skills")
                    .font(Fonts.listHeadline)
                if skills.isEmpty {
                    Text("Noch keine Skills ...")
                    Spacer()
                } else {
                    List {
                        ForEach(skills) { skill in
                            Text(skill.title)
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .padding()
            .sheet(isPresented: $sheetIsVisible) {
                SkillAddView(sheetIsVisible: $sheetIsVisible)
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
    SkillsView()
}
