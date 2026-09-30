import SwiftUI

struct LaneCourse: Identifiable {
    let id = UUID()
    let code: String
    let name: String
    let professor: String
    let location: String
    let meetingTime: String
    let icon: String
    let color: Color
}

struct MyCoursesView: View {

    private let courses = [

        LaneCourse(
            code: "CSC 330",
            name: "Survey of Programming Languages",
            professor: "Professor",
            location: "Lane College",
            meetingTime: "View class schedule",
            icon: "laptopcomputer",
            color: .blue
        ),

        LaneCourse(
            code: "CSC",
            name: "Fundamentals of Cybersecurity",
            professor: "Professor",
            location: "Lane College",
            meetingTime: "View class schedule",
            icon: "lock.shield.fill",
            color: .purple
        ),

        LaneCourse(
            code: "PHY",
            name: "Physics",
            professor: "Professor",
            location: "Lane College",
            meetingTime: "View class schedule",
            icon: "atom",
            color: .orange
        )
    ]

    var body: some View {

        ScrollView {

            VStack(alignment: .leading, spacing: 20) {

                header

                Text("Current Courses")
                    .font(.title2.bold())

                ForEach(courses) { course in

                    NavigationLink {

                        CourseDetailView(course: course)

                    } label: {

                        CourseCard(course: course)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("My Courses")
        .navigationBarTitleDisplayMode(.inline)
    }


    // MARK: - HEADER

    private var header: some View {

        HStack(spacing: 15) {

            Image(systemName: "books.vertical.fill")
                .font(.largeTitle)
                .foregroundStyle(.white)
                .padding()
                .background(.blue.gradient)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 4) {

                Text("My Academics")
                    .font(.title.bold())

                Text("Courses • Professors • Assignments")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()
        }
        .padding()
        .background(.background)
        .clipShape(
            RoundedRectangle(cornerRadius: 22)
        )
    }
}


// MARK: - COURSE CARD

struct CourseCard: View {

    let course: LaneCourse

    var body: some View {

        HStack(spacing: 15) {

            Image(systemName: course.icon)
                .font(.title2)
                .foregroundStyle(.white)
                .frame(width: 55, height: 55)
                .background(course.color.gradient)
                .clipShape(
                    RoundedRectangle(cornerRadius: 16)
                )

            VStack(alignment: .leading, spacing: 5) {

                Text(course.code)
                    .font(.caption.bold())
                    .foregroundStyle(course.color)

                Text(course.name)
                    .font(.headline)
                    .foregroundStyle(.primary)

                Text(course.professor)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(.secondary)
        }
        .padding()
        .background(.background)
        .clipShape(
            RoundedRectangle(cornerRadius: 20)
        )
    }
}


#Preview {

    NavigationStack {
        MyCoursesView()
    }
}
