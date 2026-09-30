import SwiftUI

struct AssignmentsView: View {
    var body: some View {
        Text("Assignments")
            .font(.title)
            .padding()
            .navigationTitle("Assignments")
    }
}

#Preview {
    NavigationStack { AssignmentsView() }
}
