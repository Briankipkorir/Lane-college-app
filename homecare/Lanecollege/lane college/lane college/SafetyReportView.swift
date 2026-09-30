import SwiftUI

struct SafetyReportScreen: View {
    var body: some View {
        Text("Report Safety Concern")
            .font(.title)
            .padding()
            .navigationTitle("Safety Report")
    }
}

#Preview {
    NavigationStack { SafetyReportScreen() }
}
