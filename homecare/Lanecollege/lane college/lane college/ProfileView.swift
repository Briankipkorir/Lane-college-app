import SwiftUI

struct ProfileView: View {

    @EnvironmentObject var session: SessionManager
    @AppStorage("selectedTheme") private var selectedTheme = "Purple"

    @State private var showingSignOutAlert = false

    var body: some View {

        NavigationStack {

            ScrollView {

                VStack(spacing: 22) {

                    profileHeader

                    roleInformation

                    accountSection

                    roleTools

                    settingsSection

                    signOutButton
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Profile")
        }
        .alert(
            "Sign Out?",
            isPresented: $showingSignOutAlert
        ) {

            Button("Cancel", role: .cancel) {}

            Button("Sign Out", role: .destructive) {
                session.signOut()
            }

        } message: {

            Text(
                "You will need to verify your phone again to sign back in."
            )
        }
    }


    // MARK: - PROFILE HEADER

    private var profileHeader: some View {

        VStack(spacing: 14) {

            Image("LaneDragon")
                .resizable()
                .scaledToFit()
                .frame(height: 120)

            ZStack {

                Circle()
                    .fill(
                        session.selectedRole.color.gradient
                    )
                    .frame(width: 90, height: 90)

                Image(
                    systemName:
                        session.selectedRole.icon
                )
                .font(.system(size: 40))
                .foregroundStyle(.white)
            }

            Text(session.fullName)
                .font(.title.bold())
                .multilineTextAlignment(.center)

            Text(session.selectedRole.rawValue)
                .font(.headline)
                .foregroundStyle(
                    session.selectedRole.color
                )

            Text("Lane College")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text("The Next Level of Excellence")
                .font(.headline)
                .italic()
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.background)
        .clipShape(
            RoundedRectangle(cornerRadius: 26)
        )
    }


    // MARK: - ROLE INFORMATION

    private var roleInformation: some View {

        HStack(spacing: 12) {

            ProfileStatCard(
                title: "Role",
                value: session.selectedRole.rawValue,
                icon: session.selectedRole.icon,
                color: session.selectedRole.color
            )

            ProfileStatCard(
                title: "Status",
                value: "Verified",
                icon: "checkmark.shield.fill",
                color: .green
            )
        }
    }


    // MARK: - ACCOUNT

    private var accountSection: some View {

        VStack(alignment: .leading, spacing: 15) {

            Text("Lane Account")
                .font(.title2.bold())

            ProfileInformationRow(
                title: "Name",
                value: session.fullName,
                icon: "person.fill",
                color: .blue
            )

            ProfileInformationRow(
                title: "Lane Email",
                value: session.laneEmail.isEmpty
                    ? "Not provided"
                    : session.laneEmail,
                icon: "envelope.fill",
                color: .purple
            )

            ProfileInformationRow(
                title: "Phone",
                value: session.phoneNumber.isEmpty
                    ? "Not provided"
                    : "+1 \(session.phoneNumber)",
                icon: "phone.fill",
                color: .green
            )

            ProfileInformationRow(
                title: "Verification",
                value: session.phoneVerified
                    ? "Phone Verified"
                    : "Not Verified",
                icon: "checkmark.seal.fill",
                color: .green
            )
        }
    }


    // MARK: - ROLE TOOLS

    @ViewBuilder
    private var roleTools: some View {

        switch session.selectedRole {

        case .student:

            studentTools

        case .faculty:

            facultyTools

        case .staff:

            staffTools
        }
    }


    // MARK: - STUDENT TOOLS

    private var studentTools: some View {

        VStack(alignment: .leading, spacing: 15) {

            Text("Student")
                .font(.title2.bold())

            NavigationLink {
                AcademicsView()
            } label: {
                ProfileMenuRow(
                    title: "My Academics",
                    subtitle: "Courses, grades & assignments",
                    icon: "graduationcap.fill",
                    color: .blue
                )
            }

            NavigationLink {
                AssignmentsView()
            } label: {
                ProfileMenuRow(
                    title: "My Assignments",
                    subtitle: "View coursework & deadlines",
                    icon: "checklist",
                    color: .orange
                )
            }

            NavigationLink {
                AppointmentView(
                    title: "Academic Advisor",
                    icon: "person.fill",
                    color: .purple
                )
            } label: {
                ProfileMenuRow(
                    title: "My Advisor",
                    subtitle: "Advising & appointments",
                    icon: "person.fill",
                    color: .purple
                )
            }

            NavigationLink {
                ChatView()
            } label: {
                ProfileMenuRow(
                    title: "Class Chats",
                    subtitle: "Connect with your classes",
                    icon: "bubble.left.and.bubble.right.fill",
                    color: .green
                )
            }
        }
    }


    // MARK: - FACULTY TOOLS

    private var facultyTools: some View {

        VStack(alignment: .leading, spacing: 15) {

            Text("Faculty")
                .font(.title2.bold())

            NavigationLink {
                PlaceholderView(
                    title: "My Courses",
                    icon: "books.vertical.fill"
                )
            } label: {
                ProfileMenuRow(
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
                ProfileMenuRow(
                    title: "Class Management",
                    subtitle: "Students & course information",
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
                ProfileMenuRow(
                    title: "Office Hours",
                    subtitle: "Manage student appointments",
                    icon: "calendar",
                    color: .orange
                )
            }

            NavigationLink {
                ChatView()
            } label: {
                ProfileMenuRow(
                    title: "Class Communication",
                    subtitle: "Messages & class discussions",
                    icon: "bubble.left.and.bubble.right.fill",
                    color: .green
                )
            }
        }
    }


    // MARK: - STAFF TOOLS

    private var staffTools: some View {

        VStack(alignment: .leading, spacing: 15) {

            Text("Staff")
                .font(.title2.bold())

            NavigationLink {
                CampusDirectoryView()
            } label: {
                ProfileMenuRow(
                    title: "Campus Directory",
                    subtitle: "Faculty, staff & departments",
                    icon: "person.2.fill",
                    color: .blue
                )
            }

            NavigationLink {
                PlaceholderView(
                    title: "Department",
                    icon: "building.2.fill"
                )
            } label: {
                ProfileMenuRow(
                    title: "My Department",
                    subtitle: "Department tools & resources",
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
                ProfileMenuRow(
                    title: "Announcements",
                    subtitle: "Create & manage announcements",
                    icon: "megaphone.fill",
                    color: .orange
                )
            }

            NavigationLink {
                ChatView()
            } label: {
                ProfileMenuRow(
                    title: "Staff Communication",
                    subtitle: "Campus communication",
                    icon: "bubble.left.and.bubble.right.fill",
                    color: .green
                )
            }
        }
    }


    // MARK: - SETTINGS

    private var settingsSection: some View {

        VStack(alignment: .leading, spacing: 15) {

            Text("Settings")
                .font(.title2.bold())

            HStack {

                Image(systemName: "paintpalette.fill")
                    .foregroundStyle(.purple)

                Text("App Theme")

                Spacer()

                Picker(
                    "Theme",
                    selection: $selectedTheme
                ) {

                    Text("Purple").tag("Purple")
                    Text("Blue").tag("Blue")
                    Text("Pink").tag("Pink")
                    Text("Green").tag("Green")
                    Text("Orange").tag("Orange")
                }
            }
            .padding()
            .background(.background)
            .clipShape(
                RoundedRectangle(cornerRadius: 18)
            )
        }
    }


    // MARK: - SIGN OUT

    private var signOutButton: some View {

        Button {

            showingSignOutAlert = true

        } label: {

            HStack {

                Spacer()

                Image(
                    systemName:
                        "rectangle.portrait.and.arrow.right"
                )

                Text("Sign Out")
                    .fontWeight(.bold)

                Spacer()
            }
            .foregroundStyle(.red)
            .padding()
            .background(.background)
            .clipShape(
                RoundedRectangle(cornerRadius: 18)
            )
        }
    }
}


// MARK: - PROFILE STAT CARD

struct ProfileStatCard: View {

    let title: String
    let value: String
    let icon: String
    let color: Color

    var body: some View {

        VStack(spacing: 8) {

            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(color)

            Text(value)
                .font(.headline)
                .multilineTextAlignment(.center)

            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.background)
        .clipShape(
            RoundedRectangle(cornerRadius: 18)
        )
    }
}


// MARK: - INFORMATION ROW

struct ProfileInformationRow: View {

    let title: String
    let value: String
    let icon: String
    let color: Color

    var body: some View {

        HStack(spacing: 15) {

            Image(systemName: icon)
                .foregroundStyle(color)
                .frame(width: 35)

            VStack(alignment: .leading, spacing: 3) {

                Text(title)
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Text(value)
                    .font(.headline)
            }

            Spacer()
        }
        .padding()
        .background(.background)
        .clipShape(
            RoundedRectangle(cornerRadius: 18)
        )
    }
}


// MARK: - PROFILE MENU ROW

struct ProfileMenuRow: View {

    let title: String
    let subtitle: String
    let icon: String
    let color: Color

    var body: some View {

        HStack(spacing: 15) {

            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(color)
                .frame(width: 42)

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

    ProfileView()
        .environmentObject(SessionManager())
}
