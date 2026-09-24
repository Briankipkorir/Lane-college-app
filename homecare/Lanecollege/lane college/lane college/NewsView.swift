import SwiftUI

struct NewsView: View {
    var body: some View {
        Text("News")
            .font(.title)
            .padding()
            .navigationTitle("News")
    }
}

#Preview {
    NavigationStack { NewsView() }
}
