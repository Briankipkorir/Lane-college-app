import Foundation

struct Course: Identifiable, Codable, Hashable {
    let id: UUID
    var code: String // e.g., CS 101
    var title: String
    var instructor: String
    var term: String // e.g., Fall 2026

    init(id: UUID = UUID(), code: String, title: String, instructor: String, term: String) {
        self.id = id
        self.code = code
        self.title = title
        self.instructor = instructor
        self.term = term
    }
}

struct Assignment: Identifiable, Codable, Hashable {
    let id: UUID
    var courseID: UUID
    var title: String
    var details: String
    var dueDate: Date
    var points: Int

    init(id: UUID = UUID(), courseID: UUID, title: String, details: String, dueDate: Date, points: Int) {
        self.id = id
        self.courseID = courseID
        self.title = title
        self.details = details
        self.dueDate = dueDate
        self.points = points
    }
}

struct Submission: Identifiable, Codable, Hashable {
    let id: UUID
    var assignmentID: UUID
    var submittedAt: Date
    var notes: String?
    var fileName: String?
    var grade: Double? // optional until graded

    init(id: UUID = UUID(), assignmentID: UUID, submittedAt: Date = Date(), notes: String? = nil, fileName: String? = nil, grade: Double? = nil) {
        self.id = id
        self.assignmentID = assignmentID
        self.submittedAt = submittedAt
        self.notes = notes
        self.fileName = fileName
        self.grade = grade
    }
}

extension Assignment {
    var isOverdue: Bool { Date() > dueDate }
    var dueDateString: String { dueDate.formatted(date: .abbreviated, time: .shortened) }
}
