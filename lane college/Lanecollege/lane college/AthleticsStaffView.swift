import SwiftUI

struct AthleticsStaffView: View {

    var body: some View {

        ScrollView {

            VStack(spacing: 22) {

                header

                staffDirectory

                officialDirectory
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Athletics Staff")
        .navigationBarTitleDisplayMode(.inline)
    }


    // MARK: - HEADER

    private var header: some View {

        VStack(spacing: 14) {

            Image(systemName: "person.3.fill")
                .font(.system(size: 50))
                .foregroundStyle(.white)
                .padding(22)
                .background(.blue.gradient)
                .clipShape(Circle())

            Text("Athletics Department")
                .font(.title.bold())

            Text("Lane College Dragons")
                .font(.headline)
                .foregroundStyle(.secondary)

            Text("Administration • Coaches • Trainers • Staff")
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


    // MARK: - STAFF DIRECTORY

    private var staffDirectory: some View {

        VStack(alignment: .leading, spacing: 15) {

            Text("Athletics Directory")
                .font(.title2.bold())


            NavigationLink {

                WebView(
                    url: URL(
                        string:
                        "https://golcdragons.com/staff-directory"
                    )!
                )
                .ignoresSafeArea()

            } label: {

                AthleticsStaffRow(
                    title: "Athletics Administration",
                    subtitle: "Athletic director & department staff",
                    icon: "person.badge.shield.checkmark.fill",
                    color: .blue
                )
            }


            NavigationLink {

                WebView(
                    url: URL(
                        string:
                        "https://golcdragons.com/staff-directory"
                    )!
                )
                .ignoresSafeArea()

            } label: {

                AthleticsStaffRow(
                    title: "Head Coaches",
                    subtitle: "View Lane College coaching staff",
                    icon: "figure.run",
                    color: .orange
                )
            }


            NavigationLink {

                WebView(
                    url: URL(
                        string:
                        "https://golcdragons.com/staff-directory"
                    )!
                )
                .ignoresSafeArea()

            } label: {

                AthleticsStaffRow(
                    title: "Athletic Training",
                    subtitle: "Sports medicine & athletic training",
                    icon: "cross.case.fill",
                    color: .red
                )
            }


            NavigationLink {

                AppointmentView(
                    title: "Athletic Trainer",
                    icon: "cross.case.fill",
                    color: .red
                )

            } label: {

                AthleticsStaffRow(
                    title: "Request Trainer Appointment",
                    subtitle: "Treatment & evaluation request",
                    icon: "calendar.badge.plus",
                    color: .green
                )
            }
        }
    }


    // MARK: - OFFICIAL DIRECTORY

    private var officialDirectory: some View {

        VStack(alignment: .leading, spacing: 15) {

            Text("Official Information")
                .font(.title2.bold())

            NavigationLink {

                WebView(
                    url: URL(
                        string:
                        "https://golcdragons.com/staff-directory"
                    )!
                )
                .ignoresSafeArea()

            } label: {

                HStack(spacing: 15) {

                    Image(systemName: "globe")
                        .font(.title2)
                        .foregroundStyle(.white)
                        .padding(12)
                        .background(.purple.gradient)
                        .clipShape(Circle())

                    VStack(
                        alignment: .leading,
                        spacing: 4
                    ) {

                        Text("Official Staff Directory")
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
}


// MARK: - STAFF ROW

struct AthleticsStaffRow: View {

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

        AthleticsStaffView()
    }
}
