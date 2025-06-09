//
//  SkillAddView.swift
//  TraumJobs
//
//  Created by Rylie Castell on 05.06.25.
//

import SwiftUI

struct SkillAddView: View {
    @Environment(\.modelContext) var context
    @Binding var sheetIsVisible: Bool
    @State var newSkillTitle: String = ""
    @State var newSkillLevel: SkillLevel = .medium
    var body: some View {
        VStack {
            Form {
                Section("Titel") {
                    TextField("Titel", text: $newSkillTitle)
                }
                Section("Level") {
                    Picker("Level", selection: $newSkillLevel) {
                        ForEach(SkillLevel.allCases, id: \.rawValue) { level in
                            Text(level.rawValue).tag(level)
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(height: 56)
                }
            }
            HStack {
                Button("Abbrechen") {
                    resetForm()
                    sheetIsVisible = false
                }
                Spacer()
                Button("Hinzufügen") {
                    addSkill()
                    resetForm()
                    sheetIsVisible = false
                }
            }
        }
    }

    private func resetForm() {
        newSkillTitle = ""
        newSkillLevel = .medium
    }

    private func addSkill() {
        let newSkill = Skill(title: newSkillTitle, level: newSkillLevel)
        context.insert(newSkill)
    }
}

#Preview {
    @Previewable @State var sheetIsVisible: Bool = true
    SkillAddView(sheetIsVisible: $sheetIsVisible)
}
