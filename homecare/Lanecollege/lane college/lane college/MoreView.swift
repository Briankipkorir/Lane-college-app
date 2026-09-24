import SwiftUI

struct MoreView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Academics") {
                    NavigationLink("Credits", destination: CreditsView())
                    NavigationLink("Transfer Transcripts", destination: TranscriptsView())
                }
                Section("Communications") {
                    NavigationLink("Email (Outlook)", destination: OutlookView())
                    NavigationLink("Chapel", destination: ChapelView())
                }
                Section("About & Settings") {
                    NavigationLink("About Lane College", destination: AboutView())
                    NavigationLink("Settings", destination: SettingsView())
                }
            }
            .navigationTitle("More")
        }
    }
}

#Preview {
    MoreView()
}
