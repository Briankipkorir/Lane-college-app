import SwiftUI

struct LaneResource: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let icon: String
    let color: Color
    let url: String
}

struct LaneLinksView: View {

    @State private var searchText = ""

    private let resources = [

        LaneResource(
            title: "Blackboard",
            subtitle: "Classes, assignments & course resources",
            icon: "rectangle.and.pencil.and.ellipsis",
            color: .blue,
            url: "https://www.lanecollege.edu/current-students/blackboard-and-cams"
        ),

        LaneResource(
            title: "Elements",
            subtitle: "Registration, classes & grades",
            icon: "person.text.rectangle",
            color: .purple,
            url: "https://www.lanecollege.edu/current-students/blackboard-and-cams"
        ),

        LaneResource(
            title: "Student Email",
            subtitle: "Lane College email",
            icon: "envelope.fill",
            color: .orange,
            url: "https://www.lanecollege.edu/current-students/blackboard-and-cams"
        ),

        LaneResource(
            title: "Library",
            subtitle: "Research, databases & library services",
            icon: "books.vertical.fill",
            color: .green,
            url: "https://www.lanecollege.edu/academics/library"
        ),

        LaneResource(
            title: "Registrar",
            subtitle: "Registration, records & transcripts",
            icon: "doc.text.fill",
            color: .blue,
            url: "https://www.lanecollege.edu/current-students/registrar"
        ),

        LaneResource(
            title: "Academic Calendar",
            subtitle: "Important academic dates",
            icon: "calendar",
            color: .pink,
            url: "https://www.lanecollege.edu/academics/course-schedule-1"
        ),

        LaneResource(
            title: "Academic Support",
            subtitle: "Writing, STEM and academic centers",
            icon: "graduationcap.fill",
            color: .indigo,
            url: "https://www.lanecollege.edu/current-students/academic-centers"
        ),

        LaneResource(
            title: "Faculty & Staff Directory",
            subtitle: "Find faculty and staff",
            icon: "person.2.fill",
            color: .purple,
            url: "https://www.lanecollege.edu/directory"
        ),

        LaneResource(
            title: "Campus Map",
            subtitle: "Buildings and campus facilities",
            icon: "map.fill",
            color: .green,
            url: "https://www.lanecollege.edu/about/campus"
        ),

        LaneResource(
            title: "Current Students",
            subtitle: "Official student resources",
            icon: "person.crop.circle.fill",
            color: .orange,
            url: "https://www.lanecollege.edu/current-students"
        )
    ]

    private var filteredResources: [LaneResource] {

        if searchText.isEmpty {
            return resources
        }

        return resources.filter {
            $0.title.localizedCaseInsensitiveContains(searchText)
            ||
            $0.subtitle.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {

        List(filteredResources) { resource in

            NavigationLink {

                if let url = URL(string: resource.url) {
                    WebView(url: url)
                        .ignoresSafeArea()
                }

            } label: {

                HStack(spacing: 15) {

                    ZStack {
                        RoundedRectangle(cornerRadius: 14)
                            .fill(resource.color.opacity(0.15))
                            .frame(width: 52, height: 52)

                        Image(systemName: resource.icon)
                            .font(.title2)
                            .foregroundStyle(resource.color)
                    }

                    VStack(alignment: .leading, spacing: 4) {

                        Text(resource.title)
                            .font(.headline)

                        Text(resource.subtitle)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
                .padding(.vertical, 4)
            }
        }
        .navigationTitle("Lane Resources")
        .searchable(
            text: $searchText,
            prompt: "Search resources"
        )
    }
}

#Preview {
    NavigationStack {
        LaneLinksView()
    }
}
