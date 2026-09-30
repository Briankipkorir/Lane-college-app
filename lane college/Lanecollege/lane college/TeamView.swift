import SwiftUI

struct TeamView: View {

    let sport: LaneSport

    var body: some View {

        ScrollView {

            VStack(spacing: 22) {

                teamHeader

                teamLinks

                officialTeamPage
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle(sport.name)
        .navigationBarTitleDisplayMode(.inline)
    }


    // MARK: - TEAM HEADER

    private var teamHeader: some View {

        VStack(spacing: 14) {

            Image(systemName: sport.icon)
                .font(.system(size: 55))
                .foregroundStyle(.white)
                .frame(width: 100, height: 100)
                .background(sport.color.gradient)
                .clipShape(Circle())

            Text(sport.name.uppercased())
                .font(.title.bold())
                .multilineTextAlignment(.center)

            Text("LANE COLLEGE DRAGONS")
                .font(.subheadline.bold())
                .foregroundStyle(.secondary)

            Text("Schedules • Rosters • Coaches • News")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 25)
        .background(.background)
        .clipShape(
            RoundedRectangle(cornerRadius: 25)
        )
    }


    // MARK: - TEAM LINKS

    private var teamLinks: some View {

        VStack(alignment: .leading, spacing: 15) {

            Text("Team Information")
                .font(.title2.bold())

            NavigationLink {

                WebView(
                    url: teamURL(page: "schedule")
                )
                .ignoresSafeArea()

            } label: {

                TeamMenuRow(
                    title: "Schedule",
                    subtitle: "Upcoming games & results",
                    icon: "calendar",
                    color: .blue
                )
            }


            NavigationLink {

                WebView(
                    url: teamURL(page: "roster")
                )
                .ignoresSafeArea()

            } label: {

                TeamMenuRow(
                    title: "Roster",
                    subtitle: "Players & student-athletes",
                    icon: "person.3.fill",
                    color: .purple
                )
            }


            NavigationLink {

                WebView(
                    url: officialTeamURL
                )
                .ignoresSafeArea()

            } label: {

                TeamMenuRow(
                    title: "Coaches",
                    subtitle: "Coaching staff",
                    icon: "person.badge.shield.checkmark.fill",
                    color: .orange
                )
            }


            NavigationLink {

                WebView(
                    url: officialTeamURL
                )
                .ignoresSafeArea()

            } label: {

                TeamMenuRow(
                    title: "Team News",
                    subtitle: "Latest Lane Dragons updates",
                    icon: "newspaper.fill",
                    color: .green
                )
            }
        }
    }


    // MARK: - OFFICIAL TEAM PAGE

    private var officialTeamPage: some View {

        VStack(alignment: .leading, spacing: 15) {

            Text("Official Athletics")
                .font(.title2.bold())

            NavigationLink {

                WebView(
                    url: officialTeamURL
                )
                .ignoresSafeArea()

            } label: {

                HStack(spacing: 15) {

                    Image(systemName: "globe")
                        .font(.title2)
                        .foregroundStyle(.white)
                        .padding(12)
                        .background(.blue.gradient)
                        .clipShape(Circle())

                    VStack(
                        alignment: .leading,
                        spacing: 4
                    ) {

                        Text("Official \(sport.name) Page")
                            .font(.headline)
                            .foregroundStyle(.primary)

                        Text("Lane College Dragons Athletics")
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
            .buttonStyle(.plain)
        }
    }


    // MARK: - URLS

    private var officialTeamURL: URL {

        URL(
            string:
                "https://golcdragons.com/sports/\(sport.path)"
        )!
    }


    private func teamURL(page: String) -> URL {

        URL(
            string:
                "https://golcdragons.com/sports/\(sport.path)/\(page)"
        )!
    }
}


// MARK: - TEAM MENU ROW

struct TeamMenuRow: View {

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

            VStack(
                alignment: .leading,
                spacing: 4
            ) {

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

        TeamView(
            sport: LaneSport(
                name: "Football",
                icon: "football.fill",
                color: .blue,
                path: "football"
            )
        )
    }
}
