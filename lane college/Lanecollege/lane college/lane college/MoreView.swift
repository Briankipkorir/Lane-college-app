import SwiftUI

struct MoreView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Academics") {
                    NavigationLink("Credits") {
                        CreditsView()
                    }
                    NavigationLink("Transfer Transcripts") {
                        TranscriptsView()
                    }
                }
                Section("Communications") {
                    NavigationLink("Email (Outlook)") {
                        OutlookView()
                    }
                    NavigationLink("Chapel") {
                        ChapelView()
                    }
                }
                Section("About & Settings") {
                    NavigationLink("About Lane College") {
                        AboutView()
                    }
                    NavigationLink("Settings") {
                        SettingsView()
                    }
                }
            }
            .navigationTitle("More")
        }
    }
}

#Preview {
    MoreView()
}
