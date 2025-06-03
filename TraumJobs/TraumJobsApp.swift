import SwiftUI
import SwiftData

@main
struct TraumJobsApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Job.self])
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Job.self, inMemory: true)
}
