import SwiftUI

struct SafetyReportView: View {
    var body: some View {
        Text("Report Safety Concern")
            .font(.title)
            .padding()
            .navigationTitle("Safety Report")
    }
}

#Preview {
    NavigationStack { SafetyReportView() }
}
