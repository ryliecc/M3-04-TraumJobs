//
//  JobAddView.swift
//  TraumJobs
//
//  Created by Rylie Castell on 03.06.25.
//

import SwiftData
import SwiftUI

struct JobAddView: View {
    @Environment(\.modelContext) private var context
    @Binding var sheetIsVisible: Bool
    @State var title: String = ""
    @State var details: String = ""
    @State var skills: [Skill] = []
    @State var newSkillName: String = ""
    @State var newSkillLevel: SkillLevel = .medium
    @State var salary: Int = 0
    var body: some View {
        VStack {
            Text("Neuen Job hinzufügen")
                .font(.title2)
                .bold()
                .underline()
            Form {
                Section {
                    TextField("Jobtitel", text: $title)
                    TextField("Gehalt", value: $salary, format: .number)
                        .keyboardType(.numbersAndPunctuation)
                }
                Section("Skills") {
                    List {
                        ForEach(skills, id: \.id) { skill in
                            Text("\(skill.title) - \(skill.level.rawValue)")
                        }
                    }
                    HStack {
                        VStack {
                            TextField("Skill Titel", text: $newSkillName)
                            Picker("Skill Level", selection: $newSkillLevel) {
                                ForEach(SkillLevel.allCases, id: \.rawValue) { level in
                                    Text(level.rawValue).tag(level)
                                }
                            }
                            .pickerStyle(.wheel)
                            .frame(height: 56)
                        }
                        Button("Hinzufügen") {
                            let newSkill = Skill(title: newSkillName, level: newSkillLevel)
                            skills.append(newSkill)
                            newSkillName = ""
                        }
                    }
                }
                Section("Weitere Details") {
                    TextField("Weitere Details", text: $details)
                }
            }
            HStack {
                Button("Abbrechen") {
                    resetForm()
                    sheetIsVisible = false
                }
                .frame(width: .infinity)
                Spacer()
                Button("Speichern") {
                    addJob()
                    resetForm()
                    sheetIsVisible = false
                }
                .disabled(title.isEmpty || details.isEmpty || salary <= 0)
                .frame(width: .infinity)
            }
            .padding()
            .padding(.horizontal, 20)
        }
    }

    private func addJob() {
        let job = Job(title: title, details: details, salary: salary, skills: skills)
        context.insert(job)
    }

    private func resetForm() {
        title = ""
        details = ""
        salary = 0
    }
}

#Preview {
    @Previewable @State var sheetIsVisible: Bool = true
    JobAddView(sheetIsVisible: $sheetIsVisible)
}
