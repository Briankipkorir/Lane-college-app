import SwiftUI

struct ClassesView: View {
    @StateObject private var service = AcademicsService.shared
    @State private var isLoading = false

    var body: some View {
        NavigationStack {
            Group {
                if isLoading {
                    ProgressView("Loading courses…")
                } else if service.courses.isEmpty {
                    ContentUnavailableView("No Courses", systemImage: "book.closed.fill", description: Text("You're not enrolled in any courses."))
                } else {
                    List(service.courses) { course in
                        NavigationLink(value: course) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(course.code).font(.headline)
                                Text(course.title).font(.subheadline)
                                Text("Instructor: \(course.instructor)").font(.caption).foregroundStyle(.secondary)
                            }
                        }
                    }
                    .navigationDestination(for: StudentCourse.self) { course in
                        AssignmentsListView(course: course)
                    }
                }
            }
            .navigationTitle("Classes")
            .task { await load() }
        }
    }

    private func load() async {
        isLoading = true
        defer { isLoading = false }
        _ = try? await service.fetchCourses()
    }
}

#Preview { ClassesView() }
