import SwiftUI

struct CampusHubView: View {

    var body: some View {

        NavigationStack {

            List {

                Section("Explore Campus") {

                    NavigationLink {
                        EventsView()
                    } label: {
                        Label("Events", systemImage: "calendar")
                    }

                    NavigationLink {
                        SportsView()
                    } label: {
                        Label("Athletics", systemImage: "figure.run")
                    }

                    NavigationLink {
                        CafeteriaView()
                    } label: {
                        Label("Dining", systemImage: "fork.knife")
                    }

                    NavigationLink {
                        NewsView()
                    } label: {
                        Label("Campus News", systemImage: "newspaper.fill")
                    }

                    NavigationLink {
                        PlaceholderView(
                            title: "Clubs & Organizations",
                            icon: "person.3.fill"
                        )
                    } label: {
                        Label(
                            "Clubs & Organizations",
                            systemImage: "person.3.fill"
                        )
                    }

                    NavigationLink {
                        PlaceholderView(
                            title: "Campus Map",
                            icon: "map.fill"
                        )
                    } label: {
                        Label("Campus Map", systemImage: "map.fill")
                    }

                    NavigationLink {
                        SafetyReportView()
                    } label: {
                        Label(
                            "Campus Safety",
                            systemImage: "shield.fill"
                        )
                    }
                }
            }
            .navigationTitle("Campus 🎓")
        }
    }
}

#Preview {
    CampusHubView()
}
