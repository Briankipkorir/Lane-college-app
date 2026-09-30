import SwiftUI

struct CampusDepartment: Identifiable {

    let id = UUID()

    let name: String
    let location: String
    let icon: String
    let color: Color
}

struct CampusDirectoryView: View {

    @State private var searchText = ""

    private let departments = [

        CampusDepartment(
            name: "President's Office",
            location: "Bray Administration Building",
            icon: "building.columns.fill",
            color: .purple
        ),

        CampusDepartment(
            name: "Academic Affairs",
            location: "Bray Administration Building",
            icon: "graduationcap.fill",
            color: .blue
        ),

        CampusDepartment(
            name: "Student Affairs",
            location: "Bray Administration Building",
            icon: "person.3.fill",
            color: .orange
        ),

        CampusDepartment(
            name: "Admissions",
            location: "Bray Administration Building",
            icon: "person.badge.plus",
            color: .green
        ),

        CampusDepartment(
            name: "Financial Aid",
            location: "Bray Administration Building",
            icon: "dollarsign.circle.fill",
            color: .green
        ),

        CampusDepartment(
            name: "Registrar",
            location: "Bray Administration Building",
            icon: "doc.text.fill",
            color: .blue
        ),

        CampusDepartment(
            name: "Health Services",
            location: "570 Lane Avenue",
            icon: "cross.case.fill",
            color: .red
        ),

        CampusDepartment(
            name: "Campus Safety & Security",
            location: "Stone Hall",
            icon: "shield.fill",
            color: .red
        ),

        CampusDepartment(
            name: "Library",
            location: "Chambers-McClure Academic Center",
            icon: "books.vertical.fill",
            color: .brown
        ),

        CampusDepartment(
            name: "Music & Band",
            location: "L.J. Berry Music Hall",
            icon: "music.note",
            color: .purple
        ),

        CampusDepartment(
            name: "WLCD Radio",
            location: "P.R. Shy Hall",
            icon: "radio.fill",
            color: .pink
        )
    ]

    private var filteredDepartments: [CampusDepartment] {

        if searchText.isEmpty {
            return departments
        }

        return departments.filter {

            $0.name.localizedCaseInsensitiveContains(searchText)
            ||
            $0.location.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {

        List(filteredDepartments) { department in

            NavigationLink {

                DepartmentDetailView(
                    department: department
                )

            } label: {

                HStack(spacing: 15) {

                    Image(systemName: department.icon)
                        .foregroundStyle(department.color)
                        .font(.title2)
                        .frame(width: 45)

                    VStack(alignment: .leading) {

                        Text(department.name)
                            .font(.headline)

                        Text(department.location)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
                .padding(.vertical, 5)
            }
        }
        .navigationTitle("Directory")
        .searchable(
            text: $searchText,
            prompt: "Search Lane College"
        )
    }
}

struct DepartmentDetailView: View {

    let department: CampusDepartment

    var body: some View {

        ScrollView {

            VStack(spacing: 25) {

                Image(systemName: department.icon)
                    .font(.system(size: 65))
                    .foregroundStyle(department.color)

                Text(department.name)
                    .font(.largeTitle.bold())
                    .multilineTextAlignment(.center)

                Label(
                    department.location,
                    systemImage: "mappin.circle.fill"
                )
                .foregroundStyle(.secondary)

                NavigationLink {

                    AppointmentView(
                        title: department.name,
                        icon: department.icon,
                        color: department.color
                    )

                } label: {

                    Label(
                        "Book Appointment",
                        systemImage: "calendar.badge.plus"
                    )
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundStyle(.white)
                    .background(department.color.gradient)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 18)
                    )
                }

                Button {
                } label: {

                    Label(
                        "Find on Campus Map",
                        systemImage: "map.fill"
                    )
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        department.color.opacity(0.12)
                    )
                    .clipShape(
                        RoundedRectangle(cornerRadius: 18)
                    )
                }

                Button {
                } label: {

                    Label(
                        "Contact Office",
                        systemImage: "phone.fill"
                    )
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        Color(.secondarySystemBackground)
                    )
                    .clipShape(
                        RoundedRectangle(cornerRadius: 18)
                    )
                }
            }
            .padding()
        }
        .navigationTitle(department.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
