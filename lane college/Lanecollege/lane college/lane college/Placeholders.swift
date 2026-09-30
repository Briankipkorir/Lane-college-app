import SwiftUI

// Academics
struct TranscriptsPlaceholderView: View {
    var body: some View {
        List {
            Text("View and transfer transcripts.")
        }
        .navigationTitle("Transcripts")
    }
}
struct CreditsView: View {
    var body: some View {
        List {
            Text("Your earned credits summary.")
        }
        .navigationTitle("Credits")
    }
}

// Campus
struct MapView: View {
    var body: some View {
        VStack {
            Image(systemName: "map")
                .font(.largeTitle)
            Text("Interactive campus map coming soon.")
        }
        .padding()
        .navigationTitle("Map")
    }
}
struct RoomsView: View {
    var body: some View {
        List {
            Text("Search buildings and room numbers.")
        }
        .navigationTitle("Rooms")
    }
}
struct DormsView: View {
    var body: some View {
        List {
            Text("Browse dorms, select preferences, and manage housing.")
        }
        .navigationTitle("Dorms & Housing")
    }
}
struct SafetyReportView: View {
    var body: some View {
        Form {
            Section("Anonymous Report") {
                Text("Describe the situation…")
            }
            Section {
                Button(role: .destructive) { } label: {
                    Label("Send to Security", systemImage: "shield.lefthalf.filled")
                }
                Button { } label: {
                    Label("Escalate to Police", systemImage: "exclamationmark.triangle.fill")
                }
            }
        }
        .navigationTitle("Safety Report")
    }
}

// Life
struct ActivitiesView: View {
    var body: some View {
        List {
            Text("Clubs and campus activities.")
        }
        .navigationTitle("Activities")
    }
}

struct GamesView: View {
    var body: some View {
        VStack {
            Text("Kahoot-like quizzes and games.")
        }
        .navigationTitle("Games")
    }
}
struct RostersView: View {
    var body: some View {
        List {
            Text("Team rosters and schedules.")
        }
        .navigationTitle("Rosters")
    }
}

// News & Sports & Events
struct NewsView: View {
    var body: some View {
        List {
            Text("Campus news feed.")
        }
        .navigationTitle("News")
    }
}
struct SportsView: View {
    var body: some View {
        List {
            Text("Sports news and events.")
        }
        .navigationTitle("Sports")
    }
}

// Communications
struct OutlookView: View {
    var body: some View {
        VStack {
            Text("Outlook integration placeholder.")
        }
        .navigationTitle("Outlook")
    }
}
struct ChapelView: View {
    var body: some View {
        List {
            Text("Chapel schedules and info.")
        }
        .navigationTitle("Chapel")
    }
}

// Misc
struct AboutView: View {
    var body: some View {
        ScrollView {
            Text("Lane College app prototype. More to come.")
                .padding()
        }
        .navigationTitle("About")
    }
}
struct SettingsView: View {
    var body: some View {
        Form {
            Toggle("Notifications", isOn: .constant(true))
            Toggle("Dark Mode", isOn: .constant(false))
        }
        .navigationTitle("Settings")
    }
}

#Preview("Safety Report") {
    NavigationStack {
        SafetyReportView()
    }
}

