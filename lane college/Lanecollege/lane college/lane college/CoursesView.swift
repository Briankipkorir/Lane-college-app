import SwiftUI

struct CoursesView: View {
    @State private var selection: Int = 0

    var body: some View {
        NavigationStack {
            VStack {
                Picker("Section", selection: $selection) {
                    Text("Classes").tag(0)
                    Text("Transcripts").tag(1)
                }
                .pickerStyle(.segmented)
                .padding()

                if selection == 0 {
                    ClassesView()
                } else {
                    TranscriptsView()
                }
            }
            .navigationTitle("Courses")
        }
    }
}

struct TranscriptsView: View {
    var body: some View {
        VStack {
            Text("Transcripts Placeholder")
                .foregroundColor(.secondary)
                .padding()
            Spacer()
        }
    }
}

#Preview {
    CoursesView()
}
