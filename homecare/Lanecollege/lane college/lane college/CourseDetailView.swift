import SwiftUI

struct CourseDetailView: View {

    let course: LaneCourse

    var body: some View {

        ScrollView {

            VStack(spacing: 22) {

                courseHeader

                courseInformation

                courseTools
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle(course.code)
        .navigationBarTitleDisplayMode(.inline)
    }


    // MARK: - HEADER

    private var courseHeader: some View {

        VStack(spacing: 12) {

            Image(systemName: course.icon)
                .font(.system(size: 45))
                .foregroundStyle(.white)
                .frame(width: 90, height: 90)
                .background(course.color.gradient)
                .clipShape(Circle())

            Text(course.code)
                .font(.headline)
                .foregroundStyle(course.color)

            Text(course.name)
                .font(.title2.bold())
                .multilineTextAlignment(.center)

            Text(course.professor)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.background)
        .clipShape(
            RoundedRectangle(cornerRadius: 24)
        )
    }


    // MARK: - INFORMATION

    private var courseInformation: some View {

        VStack(alignment: .leading, spacing: 15) {

            Text("Class Information")
                .font(.title2.bold())

            Label(
                course.professor,
                systemImage: "person.fill"
            )

            Label(
                course.location,
                systemImage: "mappin.and.ellipse"
            )

            Label(
                course.meetingTime,
                systemImage: "clock.fill"
            )
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.background)
        .clipShape(
            RoundedRectangle(cornerRadius: 20)
        )
    }


    // MARK: - COURSE TOOLS

    private var courseTools: some View {

        VStack(alignment: .leading, spacing: 15) {

            Text("Course Tools")
                .font(.title2.bold())

            NavigationLink {
                AssignmentsView()
            } label: {
                CourseToolRow(
                    title: "Assignments",
                    subtitle: "Course assignments & deadlines",
                    icon: "checklist",
                    color: .orange
                )
            }

            NavigationLink {
                AppointmentView(
                    title: course.professor,
                    icon: "person.fill",
                    color: .purple
                )
            } label: {
                CourseToolRow(
                    title: "Professor",
                    subtitle: "Contact or request an appointment",
                    icon: "person.fill",
                    color: .purple
                )
            }

            NavigationLink {
                ChatView()
            } label: {
                CourseToolRow(
                    title: "Class Chat",
                    subtitle: "Discuss with classmates",
                    icon: "bubble.left.and.bubble.right.fill",
                    color: .green
                )
            }

            NavigationLink {
                PlaceholderView(
                    title: "Course Resources",
                    icon: "folder.fill"
                )
            } label: {
                CourseToolRow(
                    title: "Resources",
                    subtitle: "Notes, documents & class materials",
                    icon: "folder.fill",
                    color: .blue
                )
            }
        }
    }
}


// MARK: - COURSE TOOL ROW

struct CourseToolRow: View {

    let title: String
    let subtitle: String
    let icon: String
    let color: Color

    var body: some View {

        HStack(spacing: 15) {

            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(color)
                .frame(width: 45)

            VStack(alignment: .leading, spacing: 4) {

                Text(title)
                    .font(.headline)
                    .foregroundStyle(.primary)

                Text(subtitle)
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
            RoundedRectangle(cornerRadius: 18)
        )
    }
}


#Preview {

    NavigationStack {

        CourseDetailView(
            course: LaneCourse(
                code: "CSC 330",
                name: "Survey of Programming Languages",
                professor: "Professor",
                location: "Lane College",
                meetingTime: "View class schedule",
                icon: "laptopcomputer",
                color: .blue
            )
        )
    }
}
