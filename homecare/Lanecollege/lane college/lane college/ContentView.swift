import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTheme") private var selectedTheme = "Purple"

    var body: some View {
        TabView {

            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            AcademicsView()
                .tabItem {
                    Label("Academics", systemImage: "graduationcap.fill")
                }

            
            CampusServicesView()
                .tabItem {
                    Label("Campus", systemImage: "building.2.fill")
                }

            ChatView()
                .tabItem {
                    Label("Chat", systemImage: "bubble.left.and.bubble.right.fill")
                }

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle.fill")
                }
        }
        .tint(AppTheme.color(for: selectedTheme))
    }
}

#Preview {
    ContentView()
}
