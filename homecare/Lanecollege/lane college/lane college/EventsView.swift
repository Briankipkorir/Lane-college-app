import SwiftUI

struct EventsView: View {
    var body: some View {
        Text("Events")
            .font(.title)
            .padding()
            .navigationTitle("Events")
    }
}

#Preview {
    NavigationStack { EventsView() }
}
