import SwiftUI

struct StudentProfileView: View {

    @AppStorage("studentName") private var studentName = "Student"
    @AppStorage("appAccent") private var appAccent = "Purple"

    let themes = [
        "Purple",
        "Blue",
        "Orange",
        "Green",
        "Pink",
        "Red"
    ]

    var body: some View {
        NavigationStack {
            Form {

                Section {
                    HStack {
                        Spacer()

                        VStack(spacing: 12) {
                            ZStack {
                                Circle()
                                    .fill(
                                        AppTheme.color(for: appAccent)
                                            .opacity(0.18)
                                    )
                                    .frame(width: 100, height: 100)

                                Image(systemName: "person.fill")
                                    .font(.system(size: 42))
                                    .foregroundStyle(
                                        AppTheme.color(for: appAccent)
                                    )
                            }

                            Text(studentName)
                                .font(.title2.bold())

                            Text("Lane College Student")
                                .foregroundStyle(.secondary)
                        }

                        Spacer()
                    }
                }

                Section("My Profile") {
                    TextField("Your name", text: $studentName)

                    Label(
                        "Student ID",
                        systemImage: "person.text.rectangle"
                    )

                    Label(
                        "Major",
                        systemImage: "graduationcap.fill"
                    )

                    Label(
                        "My Clubs",
                        systemImage: "person.3.fill"
                    )
                }

                Section("Make It Mine 🎨") {

                    Picker("App Color", selection: $appAccent) {
                        ForEach(themes, id: \.self) { theme in
                            Text(theme)
                        }
                    }

                    NavigationLink {
                        AppearanceSettingsView()
                    } label: {
                        Label(
                            "Fonts & Appearance",
                            systemImage: "paintbrush.fill"
                        )
                    }
                }

                Section("Student Life") {
                    Label(
                        "Saved Events",
                        systemImage: "heart.fill"
                    )

                    Label(
                        "My Study Groups",
                        systemImage: "person.3.fill"
                    )

                    Label(
                        "Notifications",
                        systemImage: "bell.fill"
                    )
                }

                Section("Safety & Privacy") {
                    Label(
                        "Privacy",
                        systemImage: "lock.fill"
                    )

                    Label(
                        "Blocked Accounts",
                        systemImage: "person.crop.circle.badge.xmark"
                    )

                    Label(
                        "Report a Problem",
                        systemImage: "exclamationmark.bubble.fill"
                    )
                }
            }
            .navigationTitle("My Profile")
        }
    }
}
