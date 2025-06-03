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
                .frame(width: .infinity)
            }
            .padding()
            .padding(.horizontal, 20)
        }
    }

    private func addJob() {
        let job = Job(title: title, details: details, salary: salary)
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
