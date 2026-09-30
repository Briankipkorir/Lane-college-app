import SwiftUI

struct AcademicsView: View {

    var body: some View {

        NavigationStack {

            List {

                Section("My Academics") {

                    NavigationLink {
                        AssignmentsView()
                    } label: {
                        Label("Assignments", systemImage: "checklist")
                    }

                    NavigationLink {
                        PlaceholderView(
                            title: "Class Schedule",
                            icon: "calendar"
                        )
                    } label: {
                        Label("Class Schedule", systemImage: "calendar")
                    }

                    NavigationLink {
                        PlaceholderView(
                            title: "Grades",
                            icon: "chart.bar.fill"
                        )
                    } label: {
                        Label("Grades", systemImage: "chart.bar.fill")
                    }

                    NavigationLink {
                        PlaceholderView(
                            title: "Courses",
                            icon: "book.closed.fill"
                        )
                    } label: {
                        Label("Courses", systemImage: "book.closed.fill")
                    }

                    NavigationLink {
                        PlaceholderView(
                            title: "Study Groups",
                            icon: "person.3.fill"
                        )
                    } label: {
                        Label("Study Groups", systemImage: "person.3.fill")
                    }

                    NavigationLink {
                        PlaceholderView(
                            title: "Tutoring",
                            icon: "person.fill.questionmark"
                        )
                    } label: {
                        Label("Tutoring", systemImage: "person.fill.questionmark")
                    }
                }
            }
            .navigationTitle("Academics 📚")
        }
    }
}

#Preview {
    AcademicsView()
}
