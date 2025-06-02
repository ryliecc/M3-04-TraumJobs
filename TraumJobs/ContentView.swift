import SwiftUI

struct ContentView: View {
    @State private var selection: TabSelection = .dashboard
    
    var body: some View {
        TabView(selection: $selection) {
            Tab("Dashboard", systemImage: "house", value: .dashboard) {
                DashboardView()
            }
            Tab("Jobs", systemImage: "suitcase", value: .jobs) {
                JobsView()
            }
            Tab("Favoriten", systemImage: "star", value: .favorites) {
                FavoritesView()
            }
            Tab("Skills", systemImage: "sparkles", value: .skills) {
                SkillsView()
            }
        }
    }
}

#Preview {
    ContentView()
}
