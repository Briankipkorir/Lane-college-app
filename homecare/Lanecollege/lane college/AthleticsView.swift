import SwiftUI

struct LaneSport: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    let color: Color
    let path: String
}

struct AthleticsView: View {

    private let sports = [

        LaneSport(
            name: "Football",
            icon: "football.fill",
            color: .blue,
            path: "football"
        ),

        LaneSport(
            name: "Men's Basketball",
            icon: "basketball.fill",
            color: .orange,
            path: "mens-basketball"
        ),

        LaneSport(
            name: "Women's Basketball",
            icon: "basketball.fill",
            color: .pink,
            path: "womens-basketball"
        ),

        LaneSport(
            name: "Volleyball",
            icon: "volleyball.fill",
            color: .purple,
            path: "womens-volleyball"
        ),

        LaneSport(
            name: "Baseball",
            icon: "baseball.fill",
            color: .red,
            path: "baseball"
        ),

        LaneSport(
            name: "Softball",
            icon: "circle.fill",
            color: .indigo,
            path: "softball"
        ),

        LaneSport(
            name: "Cross Country",
            icon: "figure.run",
            color: .green,
            path: "cross-country"
        ),

        LaneSport(
            name: "Track & Field",
            icon: "figure.run",
            color: .mint,
            path: "track-and-field"
        ),

        LaneSport(
            name: "Tennis",
            icon: "tennis.racket",
            color: .yellow,
            path: "mens-tennis"
        )
    ]

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {

        ScrollView {

            VStack(spacing: 24) {

                athleticsHeader

                quickLinks

                sportsGrid

                athleticsAdministration
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Lane Athletics")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var athleticsHeader: some View {

        VStack(spacing: 14) {

            Image(systemName: "trophy.fill")
                .font(.system(size: 55))
                .foregroundStyle(.yellow)

            Text("LANE DRAGONS")
                .font(.largeTitle.bold())
                .foregroundStyle(.white)

            Text("Athletics")
                .font(.title3.bold())
                .foregroundStyle(.white.opacity(0.9))

            Text("Teams • Schedules • Rosters • Coaches")
                .font(.caption)
                .foregroundStyle(.white.opacity(0.85))
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 30)
        .background(
            LinearGradient(
                colors: [.blue, .red],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(
            RoundedRectangle(cornerRadius: 28)
        )
    }

    private var quickLinks: some View {

        HStack(spacing: 12) {

            AthleticsQuickButton(
                title: "Schedule",
                icon: "calendar",
                color: .blue
            )

            AthleticsQuickButton(
                title: "Scores",
                icon: "sportscourt.fill",
                color: .orange
            )

            AthleticsQuickButton(
                title: "News",
                icon: "newspaper.fill",
                color: .purple
            )
        }
    }

    private var sportsGrid: some View {

        VStack(alignment: .leading, spacing: 15) {

            Text("Teams")
                .font(.title2.bold())

            LazyVGrid(
                columns: columns,
                spacing: 15
            ) {

                ForEach(sports) { sport in

                    NavigationLink {

                        TeamView(sport: sport)

                    } label: {

                        SportCard(sport: sport)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }

    private var athleticsAdministration: some View {

        VStack(alignment: .leading, spacing: 15) {

            Text("Athletics Administration")
                .font(.title2.bold())

            NavigationLink {

                AthleticsStaffView()

            } label: {

                HStack(spacing: 15) {

                    Image(systemName: "person.badge.shield.checkmark.fill")
                        .font(.title2)
                        .foregroundStyle(.white)
                        .padding(12)
                        .background(.blue.gradient)
                        .clipShape(Circle())

                    VStack(
                        alignment: .leading,
                        spacing: 4
                    ) {

                        Text("Athletics Staff")
                            .font(.headline)
                            .foregroundStyle(.primary)

                        Text(
                            "Director, coaches, trainers & administration"
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
                    RoundedRectangle(cornerRadius: 20)
                )
            }
            .buttonStyle(.plain)
        }
    }
}

struct SportCard: View {

    let sport: LaneSport

    var body: some View {

        VStack(spacing: 12) {

            Image(systemName: sport.icon)
                .font(.system(size: 35))
                .foregroundStyle(.white)
                .frame(width: 65, height: 65)
                .background(sport.color.gradient)
                .clipShape(Circle())

            Text(sport.name)
                .font(.headline)
                .foregroundStyle(.primary)
                .multilineTextAlignment(.center)

            Text("View Team")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(
            maxWidth: .infinity,
            minHeight: 155
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

struct AthleticsQuickButton: View {

    let title: String
    let icon: String
    let color: Color

    var body: some View {

        VStack(spacing: 8) {

            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(color)

            Text(title)
                .font(.caption.bold())
                .foregroundStyle(.primary)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.background)
        .clipShape(
            RoundedRectangle(cornerRadius: 18)
        )
    }
}
