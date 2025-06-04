//
//  DashboardSettings.swift
//  TraumJobs
//
//  Created by Rylie Castell on 04.06.25.
//

import SwiftUI

struct DashboardSettings: View {
    @AppStorage("username") private var username: String = "Gast"
    @AppStorage("email") private var email: String = "example@mail.com"
    @AppStorage("birthdate") private var birthdate: Date = Date()
    @AppStorage("location") private var location: String = "Berlin"
    @AppStorage("notificationsAllowed") private var notificationsAllowed: Bool = false
    @AppStorage("appLanguage") private var appLanguage: AppLanguage = .german
    @AppStorage("appThemeMode") private var appThemeMode: ThemeMode = .system
    @AppStorage("fontSize") private var fontSize: Double = 1.0
    @Binding var sheetIsVisible: Bool
    @Binding var newUsername: String
    @Binding var newEmail: String
    @Binding var newBirthdate: Date
    @Binding var newLocation: String
    @Binding var newNotificationsAllowed: Bool
    @Binding var newAppLanguage: AppLanguage
    @Binding var newAppThemeMode: ThemeMode
    @Binding var newFontSize: Double

    var body: some View {
        VStack {
            Form {
                Section("Username") {
                    TextField("Username", text: $newUsername)
                }
                Section("E-Mail") {
                    TextField("Email", text: $newEmail)
                }
                Section("Geburtsdatum") {
                    DatePicker("Birthday", selection: $newBirthdate, displayedComponents: .date)
                }
                Section("Standort") {
                    TextField("Location", text: $newLocation)
                }
                Section("Benachrichtigungen") {
                    Toggle("Benachrichtigungen zulassen", isOn: $newNotificationsAllowed)
                }
                Section("Sprache ändern") {
                    Picker("Language", selection: $newAppLanguage) {
                        ForEach(AppLanguage.allCases, id: \.rawValue) { language in
                            Text(language.rawValue).tag(language)
                        }
                    }
                }
                Section("Theme Modus") {
                    Picker("Theme Mode", selection: $newAppThemeMode) {
                        ForEach(ThemeMode.allCases, id: \.rawValue) { theme in
                            Text(theme.rawValue).tag(theme)
                        }
                    }
                }
                Section("Schriftgröße") {
                    Picker("Font Size", selection: $newFontSize) {
                        Text("Klein").tag(0.8)
                        Text("Normal").tag(1.0)
                        Text("Groß").tag(1.2)
                        Text("Sehr groß").tag(1.4)
                    }
                }
            }
            HStack {
                Button("Abbrechen") {
                    newUsername = username
                    sheetIsVisible = false
                }
                .padding()
                .frame(width: .infinity)
                Spacer()
                Button("Speichern") {
                    username = newUsername
                    email = newEmail
                    birthdate = newBirthdate
                    location = newLocation
                    notificationsAllowed = newNotificationsAllowed
                    appLanguage = newAppLanguage
                    appThemeMode = newAppThemeMode
                    fontSize = newFontSize
                    sheetIsVisible = false
                }
                .padding()
                .frame(width: .infinity)
            }
            .padding()
            .padding(.horizontal, 22)
        }
    }
}

#Preview {
    @Previewable @State var sheetIsVisible = true
    @Previewable @State var newUsername: String = "Gast"
    @Previewable @State var newEmail: String = "example@mail.com"
    @Previewable @State var newBirthdate: Date = Date()
    @Previewable @State var newLocation: String = "Berlin"
    @Previewable @State var newNotificationsAllowed: Bool = false
    @Previewable @State var newAppLanguage: AppLanguage = .german
    @Previewable @State var newAppThemeMode: ThemeMode = .system
    @Previewable @State var newFontSize: Double = 1.0
    DashboardSettings(sheetIsVisible: $sheetIsVisible, newUsername: $newUsername, newEmail: $newEmail, newBirthdate: $newBirthdate, newLocation: $newLocation, newNotificationsAllowed: $newNotificationsAllowed, newAppLanguage: $newAppLanguage, newAppThemeMode: $newAppThemeMode, newFontSize: $newFontSize)
}
