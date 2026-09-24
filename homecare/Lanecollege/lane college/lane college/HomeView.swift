import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Quick Actions") {
                    NavigationLink("Blackboard / Assignments", destination: AssignmentsView())
                    NavigationLink("News", destination: NewsView())
                    NavigationLink("Sports", destination: SportsView())
                    NavigationLink("Events", destination: EventsView())
                    NavigationLink("Cafeteria Menu", destination: CafeteriaView())
                    NavigationLink("Report Safety Concern", destination: SafetyReportView())
                }
            }
            .navigationTitle("Lane College")
        }
    }
}

#Preview {
    HomeView()
}
