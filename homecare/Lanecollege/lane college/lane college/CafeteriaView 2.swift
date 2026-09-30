import SwiftUI

struct CafeteriaScreen: View {
    var body: some View {
        Text("Cafeteria Menu")
            .font(.title)
            .padding()
            .navigationTitle("Cafeteria Menu")
    }
}

#Preview {
    NavigationStack { CafeteriaScreen() }
}
