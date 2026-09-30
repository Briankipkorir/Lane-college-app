import Foundation
import Combine

@MainActor
final class AcademicsService: ObservableObject {
    static let shared = AcademicsService()

    @Published private(set) var courses: [StudentCourse] = []
    @Published private(set) var assignments: [CourseAssignment] = []
    @Published private(set) var submissions: [UUID: AssignmentSubmission] = [:] // key: CourseAssignment.id

    private init() {
        // Seed mock data
        let c1 = StudentCourse(code: "ENG 101", title: "Composition I", instructor: "Dr. Hall", term: "Fall 2026")
        let c2 = StudentCourse(code: "CS 201", title: "Data Structures", instructor: "Prof. Nguyen", term: "Fall 2026")
        let c3 = StudentCourse(code: "BIO 110", title: "Intro Biology", instructor: "Dr. Patel", term: "Fall 2026")
        courses = [c1, c2, c3]

        let now = Date()
        assignments = [
            CourseAssignment(courseID: c1.id, title: "Essay Draft", details: "Draft 1000 words.", dueDate: Calendar.current.date(byAdding: .day, value: 3, to: now)!, points: 50),
            CourseAssignment(courseID: c1.id, title: "Peer Review", details: "Review two classmates.", dueDate: Calendar.current.date(byAdding: .day, value: 7, to: now)!, points: 25),
            CourseAssignment(courseID: c2.id, title: "Linked List", details: "Implement singly linked list.", dueDate: Calendar.current.date(byAdding: .day, value: 2, to: now)!, points: 100),
            CourseAssignment(courseID: c2.id, title: "Stacks & Queues", details: "Write unit tests.", dueDate: Calendar.current.date(byAdding: .day, value: 9, to: now)!, points: 100),
            CourseAssignment(courseID: c3.id, title: "Lab 1: Microscopy", details: "Complete lab worksheet.", dueDate: Calendar.current.date(byAdding: .day, value: 1, to: now)!, points: 20)
        ]
    }

    func fetchCourses() async throws -> [StudentCourse] {
        try await Task.sleep(nanoseconds: 150_000_000)
        return courses
    }

    func fetchAssignments(for course: StudentCourse) async throws -> [CourseAssignment] {
        try await Task.sleep(nanoseconds: 150_000_000)
        return assignments.filter { $0.courseID == course.id }.sorted { $0.dueDate < $1.dueDate }
    }

    func submission(for assignment: CourseAssignment) -> AssignmentSubmission? {
        submissions[assignment.id]
    }

    func submit(assignment: CourseAssignment, notes: String?, fileName: String?) async throws {
        try await Task.sleep(nanoseconds: 200_000_000)
        submissions[assignment.id] = AssignmentSubmission(assignmentID: assignment.id, notes: notes, fileName: fileName)
        objectWillChange.send()
    }
}
