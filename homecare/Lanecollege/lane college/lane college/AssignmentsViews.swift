import SwiftUI

struct AssignmentsListView: View {
    let course: StudentCourse
    @StateObject private var service = AcademicsService.shared
    @State private var items: [CourseAssignment] = []
    @State private var isLoading = false

    var body: some View {
        List {
            ForEach(items) { a in
                NavigationLink(value: a) {
                    HStack(alignment: .top, spacing: 10) {
                        Image(systemName: a.isOverdue ? "exclamationmark.triangle.fill" : "doc.text.fill")
                            .foregroundStyle(a.isOverdue ? Color .orange :Color .blue )
                            .frame(width: 24)
                        VStack(alignment: .leading, spacing: 4) {
                            Text(a.title).font(.headline)
                            Text(a.details).font(.subheadline).lineLimit(2).foregroundStyle(.secondary)
                            HStack {
                                Text("Due: \(a.dueDateString)").font(.caption)
                                Spacer()
                                Text("\(a.points) pts").font(.caption).foregroundStyle(.secondary)
                            }
                        }
                        if service.submission(for: a) != nil {
                            Image(systemName: "checkmark.seal.fill").foregroundStyle(.green)
                        }
                    }
                }
            }
        }
        .navigationDestination(for: CourseAssignment.self) { a in
            AssignmentDetailView(assignment: a)
        }
        .navigationTitle(course.code)
        .task { await load() }
    }

    private func load() async {
        isLoading = true
        defer { isLoading = false }
        items = (try? await service.fetchAssignments(for: course)) ?? []
    }
}

struct AssignmentDetailView: View {
    let assignment: CourseAssignment
    @ObservedObject private var service = AcademicsService.shared
    @State private var isPresentingSubmit = false

    var body: some View {
        List {
            Section("Details") {
                Text(assignment.details)
                HStack {
                    Label("Due \(assignment.dueDateString)", systemImage: "calendar").foregroundStyle(assignment.isOverdue ? .orange : .secondary)
                    Spacer()
                    Text("\(assignment.points) pts").foregroundStyle(.secondary)
                }
            }
            Section("Status") {
                if let sub = service.submission(for: assignment) {
                    VStack(alignment: .leading, spacing: 6) {
                        Label("Submitted", systemImage: "checkmark.seal.fill").foregroundStyle(.green)
                        Text("At: \(sub.submittedAt.formatted(date: .abbreviated, time: .shortened))")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        if let fn = sub.fileName { Text("File: \(fn)").font(.caption) }
                        if let g = sub.grade { Text("Grade: \(String(format: "%.1f", g))").font(.caption) }
                    }
                } else {
                    Text("Not submitted yet.")
                    Button { isPresentingSubmit = true } label: { Label("Submit Assignment", systemImage: "square.and.arrow.up") }
                }
            }
        }
        .navigationTitle(assignment.title)
        .sheet(isPresented: $isPresentingSubmit) {
            SubmissionSheet(assignment: assignment)
        }
    }
}

struct SubmissionSheet: View {
    let assignment: CourseAssignment
    @Environment(\.dismiss) private var dismiss
    @StateObject private var service = AcademicsService.shared

    @State private var notes: String = ""
    @State private var fileName: String = ""
    @State private var isSubmitting = false

    var body: some View {
        NavigationStack {
            Form {
                Section("Attach") {
                    TextField("File name (mock)", text: $fileName)
                }
                Section("Notes") {
                    TextField("Optional notes", text: $notes, axis: .vertical)
                        .lineLimit(3, reservesSpace: true)
                }
            }
            .navigationTitle("Submit")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Submit") { Task { await submit() } }.disabled(isSubmitting)
                }
            }
        }
    }

    private func submit() async {
        isSubmitting = true
        defer { isSubmitting = false }
        try? await service.submit(assignment: assignment, notes: notes.isEmpty ? nil : notes, fileName: fileName.isEmpty ? nil : fileName)
        dismiss()
    }
}

#Preview {
    NavigationStack {
        let course = StudentCourse(code: "TEST 100", title: "Preview Course", instructor: "Prof. Test", term: "Fall 2026")
        AssignmentsListView(course: course)
    }
}
