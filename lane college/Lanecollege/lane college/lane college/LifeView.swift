import SwiftUI

struct LifeView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Clubs & Activities", destination: ActivitiesView())
                NavigationLink("Student Chat", destination: ChatView())
                NavigationLink("Cafeteria Menu & Ratings", destination: CafeteriaView())
                NavigationLink("Games (Kahoot-like)", destination: GamesView())
            }
            .navigationTitle("Campus Life")
        }
    }
}

#Preview {
    LifeView()
}
