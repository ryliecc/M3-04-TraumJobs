//
//  DashboardView.swift
//  TraumJobs
//
//  Created by Rylie Castell on 02.06.25.
//

import SwiftUI

struct DashboardView: View {
    @AppStorage("username") private var username: String = "Gast"
    
    var body: some View {
        VStack {
            Spacer()
            Text("Willkommen, \(username)!")
            Spacer()
            HStack {
                Text("Neuer Name:")
                TextField("Username", text: $username)
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    DashboardView()
}
