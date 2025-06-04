//
//  DashboardView.swift
//  TraumJobs
//
//  Created by Rylie Castell on 02.06.25.
//

import SwiftUI

struct DashboardView: View {
    @AppStorage("username") private var username: String = "Gast"
    @State var sheetIsVisible: Bool = false
    @State var newUsername: String = "Gast"
    
    var body: some View {
        VStack {
            Spacer()
            Text("Willkommen, \(username)!")
            Spacer()
            Button("Einstellungen öffnen") {
                newUsername = username
                sheetIsVisible = true
            }
            Spacer()
        }
        .padding()
        .sheet(isPresented: $sheetIsVisible) {
            DashboardSettings(sheetIsVisible: $sheetIsVisible, newUsername: $newUsername)
        }
    }
}

#Preview {
    DashboardView()
}
