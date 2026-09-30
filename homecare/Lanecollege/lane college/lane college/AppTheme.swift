import SwiftUI

enum AppTheme {

    static func color(for name: String) -> Color {

        switch name {

        case "Blue":
            return .blue

        case "Pink":
            return .pink

        case "Green":
            return .green

        case "Orange":
            return .orange

        default:
            return .purple
        }
    }
}
