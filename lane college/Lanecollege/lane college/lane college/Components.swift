import SwiftUI

struct QuickActionCard: View {

    let title: String
    let subtitle: String
    let icon: String
    let color: Color

    var body: some View {

        VStack(alignment: .leading, spacing: 12) {

            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(.white)
                .padding(12)
                .background(color.gradient)
                .clipShape(Circle())

            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)

            Text(subtitle)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, minHeight: 135, alignment: .leading)
        .padding()
        .background(.background)
        .clipShape(RoundedRectangle(cornerRadius: 22))
        .shadow(color: .black.opacity(0.08), radius: 8, y: 4)
    }
}

struct DashboardCard<Content: View>: View {

    let title: String
    let icon: String
    let iconColor: Color

    @ViewBuilder let content: Content

    var body: some View {

        VStack(alignment: .leading, spacing: 15) {

            HStack {

                Image(systemName: icon)
                    .foregroundStyle(iconColor)

                Text(title)
                    .font(.title3.bold())
            }

            content
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.background)
        .clipShape(RoundedRectangle(cornerRadius: 22))
        .shadow(color: .black.opacity(0.07), radius: 8, y: 4)
    }
}

struct AssignmentRow: View {

    let title: String
    let course: String
    let due: String

    var body: some View {

        HStack {

            Image(systemName: "doc.text.fill")
                .foregroundStyle(.orange)

            VStack(alignment: .leading) {

                Text(title)
                    .font(.headline)

                Text(course)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Text(due)
                .font(.caption.bold())
                .foregroundStyle(.orange)
        }
    }
}
