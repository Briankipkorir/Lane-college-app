import SwiftUI

struct EventsView: View {
    var body: some View {
        List {
            Section(header: Text("Events")) {
                Text("Event 1")
                Text("Event 2")
            }
            Section(header: Text("People")) {
                Text("Person 1")
                Text("Person 2")
            }
        }
    }
}

#Preview {
    EventsView()
}
