//
//  JobAddView.swift
//  TraumJobs
//
//  Created by Rylie Castell on 03.06.25.
//

import SwiftUI
import SwiftData

struct JobAddView: View {
    @Environment(\.modelContext) private var context
    @Binding var sheetIsVisible: Bool
    @State var title: String = ""
    @State var details: String = ""
    @State var salaryText: String = ""
    var salary: Double {
        if let converted = Double(salaryText.replacingOccurrences(of: ",", with: ".")) {
            return converted
        } else {
            return 0.0
        }
    }
    var body: some View {
        VStack {
            Text("Neuen Job hinzufügen")
                .font(.title2)
                .bold()
                .underline()
            Form {
                TextField("Jobtitel", text: $title)
                TextField("Gehalt", text: $salaryText)
                    .keyboardType(.numbersAndPunctuation)
                TextField("Weitere Details", text: $details)
                HStack {
                    Button("Abbrechen") {
                        resetForm()
                        sheetIsVisible = false
                    }
                    Button("Speichern") {
                        addJob()
                        resetForm()
                        sheetIsVisible = false
                    }
                }
            }
        }
    }
    
    private func addJob() {
        let job = Job(title: title, details: details, salary: salary)
        context.insert(job)
    }
    
    private func resetForm() {
        title = ""
        details = ""
        salaryText = ""
    }
}

#Preview {
    @Previewable @State var sheetIsVisible: Bool = true
    JobAddView(sheetIsVisible: $sheetIsVisible)
}
