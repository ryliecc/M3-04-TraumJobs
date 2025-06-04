//
//  DashboardView.swift
//  TraumJobs
//
//  Created by Rylie Castell on 02.06.25.
//

import SwiftUI

struct DashboardView: View {
    @AppStorage("username") private var username: String = "Gast"
    @AppStorage("email") private var email: String = "example@mail.com"
    @AppStorage("birthdate") private var birthdate: Date = Date()
    @AppStorage("location") private var location: String = "Berlin"
    @AppStorage("notificationsAllowed") private var notificationsAllowed: Bool = false
    @AppStorage("appLanguage") private var appLanguage: AppLanguage = .german
    @AppStorage("appThemeMode") private var appThemeMode: ThemeMode = .system
    @AppStorage("fontSize") private var fontSize: Double = 1.0
    @State var sheetIsVisible: Bool = false
    @State var newUsername: String = "Gast"
    @State var newEmail: String = "example@mail.com"
    @State var newBirthdate: Date = Date()
    @State var newLocation: String = "Berlin"
    @State var newNotificationsAllowed: Bool = false
    @State var newAppLanguage: AppLanguage = .german
    @State var newAppThemeMode: ThemeMode = .system
    @State var newFontSize: Double = 1.0
    
    var body: some View {
        VStack {
            Spacer()
            Text("Willkommen, \(username)!")
            Spacer()
            Button("Einstellungen öffnen") {
                newUsername = username
                newEmail = email
                newBirthdate = birthdate
                newLocation = location
                newNotificationsAllowed = notificationsAllowed
                newAppLanguage = appLanguage
                newAppThemeMode = appThemeMode
                newFontSize = fontSize
                sheetIsVisible = true
            }
            Spacer()
        }
        .padding()
        .sheet(isPresented: $sheetIsVisible) {
            DashboardSettings(sheetIsVisible: $sheetIsVisible, newUsername: $newUsername, newEmail: $newEmail, newBirthdate: $newBirthdate, newLocation: $newLocation, newNotificationsAllowed: $newNotificationsAllowed, newAppLanguage: $newAppLanguage, newAppThemeMode: $newAppThemeMode, newFontSize: $newFontSize)
        }
    }
}

#Preview {
    DashboardView()
}
