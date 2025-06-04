//
//  DashboardSettings.swift
//  TraumJobs
//
//  Created by Rylie Castell on 04.06.25.
//

import SwiftUI

struct DashboardSettings: View {
    @AppStorage("username") private var username: String = "Gast"
    @Binding var sheetIsVisible: Bool
    @Binding var newUsername: String

    var body: some View {
        VStack {
            Form {
                Section("Username") {
                    TextField("Username", text: $newUsername)
                }
            }
            HStack {
                Button("Abbrechen") {
                    newUsername = username
                    sheetIsVisible = false
                }
                .padding()
                .frame(width: .infinity)
                .background(RoundedRectangle(cornerRadius: 8).fill(.red))
                Spacer()
                Button("Speichern") {
                    username = newUsername
                    sheetIsVisible = false
                }
                .padding()
                .frame(width: .infinity)
                .background(RoundedRectangle(cornerRadius: 8).fill(.yellow))
            }
            .padding()
            .padding(.horizontal, 22)
        }
    }
}

#Preview {
    @Previewable @State var sheetIsVisible = true
    @Previewable @State var newUsername = "Gast"
    DashboardSettings(
        sheetIsVisible: $sheetIsVisible,
        newUsername: $newUsername
    )
}
