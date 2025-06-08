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
        ZStack {
            Text("Willkommen,\n\(username)!")
                .padding()
                .multilineTextAlignment(.center)
                .font(Fonts.dashboardGreeting)
                .position(x: 200, y: 100)
            Button {
                newUsername = username
                newEmail = email
                newBirthdate = birthdate
                newLocation = location
                newNotificationsAllowed = notificationsAllowed
                newAppLanguage = appLanguage
                newAppThemeMode = appThemeMode
                newFontSize = fontSize
                sheetIsVisible = true
            } label: {
                Image(systemName: "gear")
            }
            .font(.system(size: 32))
            .padding()
            .foregroundColor(.white)
            .background(RoundedRectangle(cornerRadius: 8).fill(Color("PrimaryColor")))
            .position(x: 340, y: 580)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .sheet(isPresented: $sheetIsVisible) {
            DashboardSettings(sheetIsVisible: $sheetIsVisible, newUsername: $newUsername, newEmail: $newEmail, newBirthdate: $newBirthdate, newLocation: $newLocation, newNotificationsAllowed: $newNotificationsAllowed, newAppLanguage: $newAppLanguage, newAppThemeMode: $newAppThemeMode, newFontSize: $newFontSize)
        }
    }
}

#Preview {
    DashboardView()
}
