import SwiftUI

enum UserRole: String, CaseIterable, Identifiable, Codable {
    case student = "Student"
    case faculty = "Faculty"
    case staff = "Staff"

    var id: String { rawValue }

    var icon: String {
        switch self {
        case .student:
            return "graduationcap.fill"
        case .faculty:
            return "person.fill"
        case .staff:
            return "person.badge.shield.checkmark.fill"
        }
    }

    var color: Color {
        switch self {
        case .student:
            return .blue
        case .faculty:
            return .purple
        case .staff:
            return .orange
        }
    }
}
