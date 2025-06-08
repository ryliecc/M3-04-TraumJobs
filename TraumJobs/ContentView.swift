import SwiftUI

struct ContentView: View {
    @State private var selection: TabSelection = .jobs
    var body: some View {
        VStack(spacing: 0) {
            HeaderView()
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
            .accentColor(Color("PrimaryColor"))
        }
    }
}

#Preview {
    ContentView()
}
