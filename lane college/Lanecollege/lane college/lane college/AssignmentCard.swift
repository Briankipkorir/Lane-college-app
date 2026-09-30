import SwiftUI

struct AssignmentCard: View {
    let course: String
    let assignment: String
    let due: String
    let icon: String
    let color: Color

    var body: some View {
        HStack(spacing: 14) {

            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(color.opacity(0.15))
                    .frame(width: 55, height: 55)

                Image(systemName: icon)
                    .font(.title2)
                    .foregroundStyle(color)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(course)
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Text(assignment)
                    .font(.headline)

                Text(due)
                    .font(.caption.bold())
                    .foregroundStyle(color)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(.secondary)
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
