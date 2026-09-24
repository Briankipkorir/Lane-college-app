import SwiftUI

struct SportsView: View {
    var body: some View {
        Text("Sports")
            .font(.title)
            .padding()
            .navigationTitle("Sports")
    }
}

#Preview {
    NavigationStack { SportsView() }
}
