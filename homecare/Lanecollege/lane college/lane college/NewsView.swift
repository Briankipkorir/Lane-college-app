import SwiftUI

struct NewsScreen: View {
    var body: some View {
        Text("News")
            .font(.title)
            .padding()
            .navigationTitle("News")
    }
}

#Preview {
    NavigationStack { NewsScreen() }
}
