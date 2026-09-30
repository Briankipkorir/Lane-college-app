import SwiftUI

struct SportsScreen: View {
    var body: some View {
        Text("Sports")
            .font(.title)
            .padding()
            .navigationTitle("Sports")
    }
}

#Preview {
    NavigationStack { SportsScreen() }
}
