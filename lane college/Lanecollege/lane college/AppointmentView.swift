import SwiftUI

struct AppointmentView: View {

    let title: String
    let icon: String
    let color: Color

    @State private var selectedDate = Date()
    @State private var selectedTime = "10:00 AM"
    @State private var reason = ""
    @State private var showingConfirmation = false

    private let times = [
        "9:00 AM",
        "9:30 AM",
        "10:00 AM",
        "10:30 AM",
        "11:00 AM",
        "1:00 PM",
        "1:30 PM",
        "2:00 PM",
        "2:30 PM",
        "3:00 PM"
    ]

    var body: some View {

        Form {

            Section {

                HStack {

                    Spacer()

                    VStack(spacing: 12) {

                        Image(systemName: icon)
                            .font(.system(size: 50))
                            .foregroundStyle(color)

                        Text(title)
                            .font(.title2.bold())

                        Text("Schedule an appointment")
                            .foregroundStyle(.secondary)
                    }

                    Spacer()
                }
                .padding()
            }

            Section("Choose Date") {

                DatePicker(
                    "Appointment Date",
                    selection: $selectedDate,
                    in: Date()...,
                    displayedComponents: .date
                )
            }

            Section("Choose Time") {

                Picker(
                    "Available Time",
                    selection: $selectedTime
                ) {

                    ForEach(times, id: \.self) { time in
                        Text(time)
                    }
                }
            }

            Section("Reason for Visit") {

                TextField(
                    "Optional note",
                    text: $reason,
                    axis: .vertical
                )
                .lineLimit(3...6)
            }

            Section {

                Button {

                    showingConfirmation = true

                } label: {

                    HStack {

                        Spacer()

                        Label(
                            "Request Appointment",
                            systemImage: "calendar.badge.checkmark"
                        )
                        .fontWeight(.bold)

                        Spacer()
                    }
                }
            }
        }
        .navigationTitle(title)
        .alert(
            "Appointment Requested",
            isPresented: $showingConfirmation
        ) {

            Button("Done", role: .cancel) {}

        } message: {

            Text(
                "Prototype only. A production version will submit this request to the appropriate Lane College office."
            )
        }
    }
}
