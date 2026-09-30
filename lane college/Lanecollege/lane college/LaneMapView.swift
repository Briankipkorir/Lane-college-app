import SwiftUI

struct LaneMapView: View {

    let buildings = [
        "Bray Administration Building",
        "Chambers-McClure Academic Center",
        "Millennium Hall",
        "L.J. Berry Music Hall",
        "Stone Hall",
        "Kirkendoll Student Center",
        "Phillips Dining Hall",
        "Health Center",
        "Lane Field",
        "P.R. Shy Hall"
    ]

    var body: some View {

        VStack(spacing: 0) {

            ZStack {

                LinearGradient(
                    colors: [
                        .green.opacity(0.30),
                        .blue.opacity(0.15)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )

                VStack(spacing: 12) {

                    Image(systemName: "map.fill")
                        .font(.system(size: 65))
                        .foregroundStyle(.green)

                    Text("Interactive Lane Map")
                        .font(.title.bold())

                    Text("Tap a building below to find campus services.")
                        .foregroundStyle(.secondary)
                }
            }
            .frame(height: 260)

            List(buildings, id: \.self) { building in

                HStack {

                    Image(systemName: "mappin.circle.fill")
                        .foregroundStyle(.red)

                    Text(building)

                    Spacer()

                    Image(systemName: "location.fill")
                        .foregroundStyle(.blue)
                }
            }
        }
        .navigationTitle("Campus Map")
        .navigationBarTitleDisplayMode(.inline)
    }
}
