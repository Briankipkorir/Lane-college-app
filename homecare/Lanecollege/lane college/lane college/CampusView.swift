import SwiftUI

struct CampusView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Campus Map", destination: MapView())
                NavigationLink("Buildings & Room Finder", destination: RoomsView())
                NavigationLink("Dorms & Housing", destination: DormsView())
                NavigationLink("Security & Anonymous Report", destination: SafetyReportView())
            }
            .navigationTitle("Campus")
        }
    }
}

#Preview {
    CampusView()
}
