import SwiftUI

struct HomeView: View {

    @EnvironmentObject var session: SessionManager
    @AppStorage("selectedTheme") private var selectedTheme = "Purple"

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {

        NavigationStack {

            ScrollView {

                VStack(spacing: 24) {

                    welcomeHeader

                    roleBadge

                    quickActions

                    roleDashboard

                    campusNow

                    safetyCard
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Lane")
            .navigationBarTitleDisplayMode(.inline)
        }
    }


    // MARK: - WELCOME HEADER

    private var welcomeHeader: some View {

        VStack(spacing: 16) {

            HStack(alignment: .center, spacing: 15) {

                Image("LaneDragon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 95, height: 95)

                VStack(alignment: .leading, spacing: 5) {

                    Text(greeting)
                        .font(.caption.bold())
                        .foregroundStyle(.white.opacity(0.85))

                    Text(session.fullName.isEmpty
                         ? "Lane Dragon"
                         : session.fullName)
                        .font(.title2.bold())
                        .foregroundStyle(.white)

                    Text(session.selectedRole.rawValue)
                        .font(.subheadline.bold())
                        .foregroundStyle(.white.opacity(0.9))
                }

                Spacer()
            }

            Divider()
                .overlay(.white.opacity(0.35))

            HStack {

                Image(systemName: "sparkles")

                Text("The Next Level of Excellence")
                    .font(.headline)

                Spacer()
            }
            .foregroundStyle(.white)
        }
        .padding()
        .background(
            LinearGradient(
                colors: [
                    session.selectedRole.color,
                    session.selectedRole.color.opacity(0.65)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(
            RoundedRectangle(cornerRadius: 28)
        )
        .shadow(
            color: session.selectedRole.color.opacity(0.20),
            radius: 10,
            y: 5
        )
    }


    // MARK: - ROLE BADGE

    private var roleBadge: some View {

        HStack(spacing: 12) {

            Image(systemName: session.selectedRole.icon)
                .font(.title2)
                .foregroundStyle(session.selectedRole.color)

            VStack(alignment: .leading, spacing: 3) {

                Text("\(session.selectedRole.rawValue) Account")
                    .font(.headline)

                Text("Lane College • Phone Verified")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Image(systemName: "checkmark.seal.fill")
                .foregroundStyle(.green)
        }
        .padding()
        .background(.background)
        .clipShape(
            RoundedRectangle(cornerRadius: 18)
        )
    }


    // MARK: - QUICK ACTIONS

    private var quickActions: some View {

        VStack(alignment: .leading, spacing: 15) {

            HStack {

                Text("Quick Actions")
                    .font(.title2.bold())

                Spacer()

                Image(systemName: "bolt.fill")
                    .foregroundStyle(.yellow)
            }

            LazyVGrid(
                columns: columns,
                spacing: 15
            ) {

                ForEach(actions) { action in

                    NavigationLink {

                        destination(for: action.destination)

                    } label: {

                        HomeActionCard(action: action)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }


    // MARK: - ROLE DASHBOARD

    @ViewBuilder
    private var roleDashboard: some View {

        switch session.selectedRole {

        case .student:
            studentDashboard

        case .faculty:
            facultyDashboard

        case .staff:
            staffDashboard
        }
    }


    // MARK: - STUDENT DASHBOARD

    private var studentDashboard: some View {

        VStack(alignment: .leading, spacing: 15) {

            Text("My Student Life")
                .font(.title2.bold())

            NavigationLink {
                AssignmentsView()
            } label: {
                HomeInformationRow(
                    title: "Assignments",
                    subtitle: "View coursework & deadlines",
                    icon: "checklist",
                    color: .orange
                )
            }

            NavigationLink {
                AcademicsView()
            } label: {
                HomeInformationRow(
                    title: "My Academics",
                    subtitle: "Courses, schedule & grades",
                    icon: "graduationcap.fill",
                    color: .blue
                )
            }

            NavigationLink {
                AppointmentView(
                    title: "Academic Advisor",
                    icon: "person.fill",
                    color: .purple
                )
            } label: {
                HomeInformationRow(
                    title: "Academic Advisor",
                    subtitle: "Advising & appointment requests",
                    icon: "person.fill",
                    color: .purple
                )
            }

            NavigationLink {
                ChatView()
            } label: {
                HomeInformationRow(
                    title: "Class Chats",
                    subtitle: "Connect with classmates",
                    icon: "bubble.left.and.bubble.right.fill",
                    color: .green
                )
            }
        }
    }


    // MARK: - FACULTY DASHBOARD

    private var facultyDashboard: some View {

        VStack(alignment: .leading, spacing: 15) {

            Text("Faculty Center")
                .font(.title2.bold())

            NavigationLink {
                PlaceholderView(
                    title: "My Courses",
                    icon: "books.vertical.fill"
                )
            } label: {
                HomeInformationRow(
                    title: "My Courses",
                    subtitle: "Courses you are teaching",
                    icon: "books.vertical.fill",
                    color: .blue
                )
            }

            NavigationLink {
                PlaceholderView(
                    title: "Class Management",
                    icon: "person.3.fill"
                )
            } label: {
                HomeInformationRow(
                    title: "Class Management",
                    subtitle: "Students, classes & course tools",
                    icon: "person.3.fill",
                    color: .purple
                )
            }

            NavigationLink {
                AppointmentView(
                    title: "Office Hours",
                    icon: "calendar",
                    color: .orange
                )
            } label: {
                HomeInformationRow(
                    title: "Office Hours",
                    subtitle: "Manage appointment requests",
                    icon: "calendar",
                    color: .orange
                )
            }

            NavigationLink {
                ChatView()
            } label: {
                HomeInformationRow(
                    title: "Class Communication",
                    subtitle: "Messages & discussions",
                    icon: "bubble.left.and.bubble.right.fill",
                    color: .green
                )
            }
        }
    }


    // MARK: - STAFF DASHBOARD

    private var staffDashboard: some View {

        VStack(alignment: .leading, spacing: 15) {

            Text("Staff Center")
                .font(.title2.bold())

            NavigationLink {
                CampusDirectoryView()
            } label: {
                HomeInformationRow(
                    title: "Campus Directory",
                    subtitle: "Faculty, staff & departments",
                    icon: "person.2.fill",
                    color: .blue
                )
            }

            NavigationLink {
                PlaceholderView(
                    title: "My Department",
                    icon: "building.2.fill"
                )
            } label: {
                HomeInformationRow(
                    title: "My Department",
                    subtitle: "Department resources & tools",
                    icon: "building.2.fill",
                    color: .purple
                )
            }

            NavigationLink {
                PlaceholderView(
                    title: "Announcements",
                    icon: "megaphone.fill"
                )
            } label: {
                HomeInformationRow(
                    title: "Announcements",
                    subtitle: "Campus communication tools",
                    icon: "megaphone.fill",
                    color: .orange
                )
            }

            NavigationLink {
                ChatView()
            } label: {
                HomeInformationRow(
                    title: "Staff Communication",
                    subtitle: "Connect across campus",
                    icon: "bubble.left.and.bubble.right.fill",
                    color: .green
                )
            }
        }
    }


    // MARK: - CAMPUS NOW

    private var campusNow: some View {

        VStack(alignment: .leading, spacing: 15) {

            HStack {

                Text("Campus Now")
                    .font(.title2.bold())

                Spacer()

                Image(systemName: "megaphone.fill")
                    .foregroundStyle(.red)
            }

            VStack(alignment: .leading, spacing: 8) {

                Label(
                    "Campus Announcements",
                    systemImage: "bell.fill"
                )
                .font(.headline)

                Text(
                    "Official campus announcements, academic notices, events and home-game alerts will appear here."
                )
                .font(.subheadline)
                .foregroundStyle(.secondary)

                Text("Prototype")
                    .font(.caption.bold())
                    .foregroundStyle(.orange)
            }
            .frame(
                maxWidth: .infinity,
                alignment: .leading
            )
            .padding()
            .background(.background)
            .clipShape(
                RoundedRectangle(cornerRadius: 18)
            )
        }
    }


    // MARK: - SAFETY

    private var safetyCard: some View {

        NavigationLink {

            SafetyReportView()

        } label: {

            HStack(spacing: 15) {

                Image(systemName: "shield.fill")
                    .font(.title)
                    .foregroundStyle(.white)

                VStack(alignment: .leading, spacing: 4) {

                    Text("Campus Safety")
                        .font(.headline)

                    Text("Safety information & reporting")
                        .font(.caption)
                }

                Spacer()

                Image(systemName: "chevron.right")
            }
            .foregroundStyle(.white)
            .padding()
            .background(.red.gradient)
            .clipShape(
                RoundedRectangle(cornerRadius: 22)
            )
        }
        .buttonStyle(.plain)
    }


    // MARK: - GREETING

    private var greeting: String {

        let hour = Calendar.current.component(
            .hour,
            from: Date()
        )

        if hour < 12 {
            return "GOOD MORNING"
        } else if hour < 17 {
            return "GOOD AFTERNOON"
        } else {
            return "GOOD EVENING"
        }
    }


    // MARK: - QUICK ACTION DATA

    private var actions: [HomeAction] {

        switch session.selectedRole {

        case .student:

            return [
                HomeAction(
                    title: "Assignments",
                    icon: "checklist",
                    color: .orange,
                    destination: .assignments
                ),

                HomeAction(
                    title: "Academics",
                    icon: "graduationcap.fill",
                    color: .blue,
                    destination: .academics
                ),

                HomeAction(
                    title: "Sports",
                    icon: "trophy.fill",
                    color: .red,
                    destination: .sports
                ),

                HomeAction(
                    title: "Events",
                    icon: "calendar",
                    color: .purple,
                    destination: .events
                ),

                HomeAction(
                    title: "Dining",
                    icon: "fork.knife",
                    color: .green,
                    destination: .dining
                ),

                HomeAction(
                    title: "Chat",
                    icon: "bubble.left.and.bubble.right.fill",
                    color: .pink,
                    destination: .chat
                )
            ]


        case .faculty:

            return [
                HomeAction(
                    title: "Courses",
                    icon: "books.vertical.fill",
                    color: .blue,
                    destination: .facultyCourses
                ),

                HomeAction(
                    title: "Students",
                    icon: "person.3.fill",
                    color: .purple,
                    destination: .students
                ),

                HomeAction(
                    title: "Office Hours",
                    icon: "calendar.badge.plus",
                    color: .orange,
                    destination: .officeHours
                ),

                HomeAction(
                    title: "Chat",
                    icon: "bubble.left.and.bubble.right.fill",
                    color: .green,
                    destination: .chat
                )
            ]


        case .staff:

            return [
                HomeAction(
                    title: "Directory",
                    icon: "person.2.fill",
                    color: .blue,
                    destination: .directory
                ),

                HomeAction(
                    title: "Department",
                    icon: "building.2.fill",
                    color: .purple,
                    destination: .department
                ),

                HomeAction(
                    title: "Announcements",
                    icon: "megaphone.fill",
                    color: .orange,
                    destination: .announcements
                ),

                HomeAction(
                    title: "Chat",
                    icon: "bubble.left.and.bubble.right.fill",
                    color: .green,
                    destination: .chat
                )
            ]
        }
    }


    // MARK: - DESTINATIONS

    @ViewBuilder
    private func destination(
        for destination: HomeDestination
    ) -> some View {

        switch destination {

        case .assignments:
            AssignmentsView()

        case .academics:
            AcademicsView()

        case .sports:
            AthleticsView()

        case .events:
            EventsView()

        case .dining:
            CafeteriaView()

        case .chat:
            ChatView()

        case .directory:
            CampusDirectoryView()

        case .officeHours:
            AppointmentView(
                title: "Office Hours",
                icon: "calendar",
                color: .orange
            )

        case .facultyCourses:
            PlaceholderView(
                title: "My Courses",
                icon: "books.vertical.fill"
            )

        case .students:
            PlaceholderView(
                title: "My Students",
                icon: "person.3.fill"
            )

        case .department:
            PlaceholderView(
                title: "My Department",
                icon: "building.2.fill"
            )

        case .announcements:
            PlaceholderView(
                title: "Announcements",
                icon: "megaphone.fill"
            )
        }
    }
}


// MARK: - HOME ACTION MODEL

struct HomeAction: Identifiable {

    let id = UUID()

    let title: String
    let icon: String
    let color: Color
    let destination: HomeDestination
}


enum HomeDestination {

    case assignments
    case academics
    case sports
    case events
    case dining
    case chat

    case directory
    case officeHours

    case facultyCourses
    case students

    case department
    case announcements
}


// MARK: - QUICK ACTION CARD

struct HomeActionCard: View {

    let action: HomeAction

    var body: some View {

        VStack(spacing: 12) {

            Image(systemName: action.icon)
                .font(.title)
                .foregroundStyle(.white)
                .frame(width: 60, height: 60)
                .background(action.color.gradient)
                .clipShape(Circle())

            Text(action.title)
                .font(.headline)
                .foregroundStyle(.primary)
                .multilineTextAlignment(.center)
        }
        .frame(
            maxWidth: .infinity,
            minHeight: 130
        )
        .padding()
        .background(.background)
        .clipShape(
            RoundedRectangle(cornerRadius: 22)
        )
        .shadow(
            color: .black.opacity(0.06),
            radius: 6,
            y: 3
        )
    }
}


// MARK: - INFORMATION ROW

struct HomeInformationRow: View {

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

    HomeView()
        .environmentObject(SessionManager())
}
