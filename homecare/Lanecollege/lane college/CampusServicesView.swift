import SwiftUI
import SafariServices

struct CampusServicesView: View {

    @AppStorage("selectedTheme") private var selectedTheme = "Purple"

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {

        NavigationStack {

            ScrollView {

                VStack(spacing: 24) {

                    header

                    studentTools

                    appointments

                    campusServices

                    emergencySection
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Campus Services")
        }
    }


    // MARK: - HEADER

    private var header: some View {

        VStack(alignment: .leading, spacing: 10) {

            Text("ESSE NON VIDERI")
                .font(.caption.bold())
                .foregroundStyle(
                    AppTheme.color(for: selectedTheme)
                )

            Text("To Be, Not to Seem")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text("Everything Lane. One Place.")
                .font(.title.bold())

            Text(
                "Find services, offices, resources and appointments without searching all over campus."
            )
            .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }


    // MARK: - STUDENT TOOLS

    private var studentTools: some View {

        VStack(alignment: .leading, spacing: 15) {

            HStack {

                Text("Student Tools")
                    .font(.title2.bold())

                Spacer()

                Image(systemName: "square.grid.2x2.fill")
                    .foregroundStyle(
                        AppTheme.color(for: selectedTheme)
                    )
            }

            LazyVGrid(columns: columns, spacing: 15) {

                // BLACKBOARD

                NavigationLink {

                    WebView(
                        url: URL(
                            string:
                            "https://www.lanecollege.edu/current-students/blackboard-and-cams"
                        )!
                    )
                    .ignoresSafeArea()

                } label: {

                    ServiceCard(
                        title: "Blackboard",
                        subtitle: "Classes & assignments",
                        icon: "rectangle.and.pencil.and.ellipsis",
                        color: .blue
                    )
                }


                // ELEMENTS

                NavigationLink {

                    WebView(
                        url: URL(
                            string:
                            "https://www.lanecollege.edu/current-students/blackboard-and-cams"
                        )!
                    )
                    .ignoresSafeArea()

                } label: {

                    ServiceCard(
                        title: "Elements",
                        subtitle: "Student portal",
                        icon: "person.text.rectangle",
                        color: .purple
                    )
                }


                // STUDENT EMAIL

                NavigationLink {

                    WebView(
                        url: URL(
                            string:
                            "https://www.lanecollege.edu/current-students/blackboard-and-cams"
                        )!
                    )
                    .ignoresSafeArea()

                } label: {

                    ServiceCard(
                        title: "Student Email",
                        subtitle: "Check your inbox",
                        icon: "envelope.fill",
                        color: .orange
                    )
                }


                // LIBRARY

                NavigationLink {

                    WebView(
                        url: URL(
                            string:
                            "https://www.lanecollege.edu/academics/library"
                        )!
                    )
                    .ignoresSafeArea()

                } label: {

                    ServiceCard(
                        title: "Library",
                        subtitle: "Research & resources",
                        icon: "books.vertical.fill",
                        color: .green
                    )
                }
            }


            // ALL RESOURCES

            NavigationLink {

                LaneLinksView()

            } label: {

                HStack(spacing: 14) {

                    Image(systemName: "link.circle.fill")
                        .font(.title2)
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(.blue.gradient)
                        .clipShape(Circle())

                    VStack(alignment: .leading, spacing: 4) {

                        Text("All Lane Resources")
                            .font(.headline)
                            .foregroundStyle(.primary)

                        Text(
                            "Academic, campus and student links"
                        )
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
            .buttonStyle(.plain)
        }
    }


    // MARK: - APPOINTMENTS

    private var appointments: some View {

        VStack(alignment: .leading, spacing: 15) {

            HStack {

                Text("Book an Appointment")
                    .font(.title2.bold())

                Spacer()

                Image(systemName: "calendar.badge.plus")
                    .foregroundStyle(.purple)
            }


            // HEALTH SERVICES

            NavigationLink {

                AppointmentView(
                    title: "Health Services",
                    icon: "cross.case.fill",
                    color: .red
                )

            } label: {

                AppointmentRow(
                    title: "Health Services",
                    subtitle: "See the campus nurse",
                    icon: "cross.case.fill",
                    color: .red
                )
            }


            // ACADEMIC ADVISOR

            NavigationLink {

                AppointmentView(
                    title: "Academic Advisor",
                    icon: "graduationcap.fill",
                    color: .blue
                )

            } label: {

                AppointmentRow(
                    title: "Academic Advisor",
                    subtitle: "Academic planning & advising",
                    icon: "graduationcap.fill",
                    color: .blue
                )
            }


            // PROFESSOR

            NavigationLink {

                AppointmentView(
                    title: "Professor",
                    icon: "person.fill",
                    color: .purple
                )

            } label: {

                AppointmentRow(
                    title: "Professor",
                    subtitle: "Schedule office hours",
                    icon: "person.fill",
                    color: .purple
                )
            }


            // FINANCIAL AID

            NavigationLink {

                AppointmentView(
                    title: "Financial Aid",
                    icon: "dollarsign.circle.fill",
                    color: .green
                )

            } label: {

                AppointmentRow(
                    title: "Financial Aid",
                    subtitle: "Meet with Financial Aid",
                    icon: "dollarsign.circle.fill",
                    color: .green
                )
            }


            // ATHLETIC TRAINER

            NavigationLink {

                AppointmentView(
                    title: "Athletic Trainer",
                    icon: "figure.run",
                    color: .orange
                )

            } label: {

                AppointmentRow(
                    title: "Athletic Trainer",
                    subtitle: "Treatment & evaluation",
                    icon: "figure.run",
                    color: .orange
                )
            }


            // HOUSING

            NavigationLink {

                AppointmentView(
                    title: "Housing",
                    icon: "house.fill",
                    color: .indigo
                )

            } label: {

                AppointmentRow(
                    title: "Housing",
                    subtitle: "Residence Life assistance",
                    icon: "house.fill",
                    color: .indigo
                )
            }
        }
    }


    // MARK: - EXPLORE LANE

    private var campusServices: some View {

        VStack(alignment: .leading, spacing: 15) {

            Text("Explore Lane")
                .font(.title2.bold())


            // DIRECTORY

            NavigationLink {

                CampusDirectoryView()

            } label: {

                CampusMenuRow(
                    title: "Campus Directory",
                    subtitle: "Faculty, staff & departments",
                    icon: "person.2.fill",
                    color: .blue
                )
            }


            // MAP

            NavigationLink {

                LaneMapView()

            } label: {

                CampusMenuRow(
                    title: "Campus Map",
                    subtitle: "Find buildings & offices",
                    icon: "map.fill",
                    color: .green
                )
            }


            // HOUSING

            NavigationLink {

                PlaceholderView(
                    title: "Housing & Residence Life",
                    icon: "building.2.fill"
                )

            } label: {

                CampusMenuRow(
                    title: "Housing & Residence Life",
                    subtitle: "Residence halls & information",
                    icon: "building.2.fill",
                    color: .orange
                )
            }


            // BAND

            NavigationLink {

                PlaceholderView(
                    title: "Band & Music",
                    icon: "music.note"
                )

            } label: {

                CampusMenuRow(
                    title: "Band & Music",
                    subtitle: "Band, choir & performances",
                    icon: "music.note",
                    color: .purple
                )
            }


            // MEDIA

            NavigationLink {

                PlaceholderView(
                    title: "Media & WLCD",
                    icon: "radio.fill"
                )

            } label: {

                CampusMenuRow(
                    title: "Media & WLCD",
                    subtitle: "Campus media & radio",
                    icon: "radio.fill",
                    color: .pink
                )
            }


            // HISTORY

            NavigationLink {

                WebView(
                    url: URL(
                        string:
                        "https://www.lanecollege.edu/about/history-of-lane-college"
                    )!
                )
                .ignoresSafeArea()

            } label: {

                CampusMenuRow(
                    title: "Lane College History",
                    subtitle: "Discover the history of Lane",
                    icon: "clock.arrow.circlepath",
                    color: .brown
                )
            }


            // ATHLETICS

            NavigationLink {

                WebView(
                    url: URL(
                        string:
                        "https://golcdragons.com"
                    )!
                )
                .ignoresSafeArea()

            } label: {

                CampusMenuRow(
                    title: "Lane Athletics",
                    subtitle: "Teams, schedules, rosters & news",
                    icon: "trophy.fill",
                    color: .orange
                )
            }
        }
    }


    // MARK: - CAMPUS SAFETY

    private var emergencySection: some View {

        VStack(alignment: .leading, spacing: 12) {

            Text("Safety")
                .font(.title2.bold())

            NavigationLink {

                SafetyReportView()

            } label: {

                HStack(spacing: 15) {

                    Image(systemName: "shield.fill")
                        .font(.title)
                        .foregroundStyle(.white)

                    VStack(
                        alignment: .leading,
                        spacing: 4
                    ) {

                        Text("Campus Safety & Security")
                            .font(.headline)

                        Text(
                            "Emergency information & reporting"
                        )
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
    }
}


// MARK: - SERVICE CARD

struct ServiceCard: View {

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
        .frame(
            maxWidth: .infinity,
            minHeight: 135,
            alignment: .leading
        )
        .padding()
        .background(.background)
        .clipShape(
            RoundedRectangle(cornerRadius: 22)
        )
        .shadow(
            color: .black.opacity(0.07),
            radius: 8,
            y: 4
        )
    }
}


// MARK: - APPOINTMENT ROW

struct AppointmentRow: View {

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

            Image(systemName: "calendar.badge.plus")
                .foregroundStyle(color)
        }
        .padding()
        .background(.background)
        .clipShape(
            RoundedRectangle(cornerRadius: 18)
        )
    }
}


// MARK: - CAMPUS MENU ROW

struct CampusMenuRow: View {

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
    CampusServicesView()
}
