import SwiftUI

struct PhoneLoginView: View {

    @EnvironmentObject var session: SessionManager

    @State private var phoneNumber = ""

    var body: some View {

        NavigationStack {

            ScrollView {

                VStack(spacing: 26) {

                    Image("LaneDragon")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 280)
                        .padding(.top, 30)

                    VStack(spacing: 8) {

                        Text("Welcome to Lane")
                            .font(.largeTitle.bold())

                        Text("The Next Level of Excellence")
                            .font(.headline)
                            .foregroundStyle(.secondary)
                    }

                    VStack(
                        alignment: .leading,
                        spacing: 10
                    ) {

                        Text("Phone Number")
                            .font(.headline)

                        HStack {

                            Text("+1")
                                .fontWeight(.semibold)

                            Divider()
                                .frame(height: 25)

                            TextField(
                                "Phone number",
                                text: $phoneNumber
                            )
                            .keyboardType(.phonePad)
                        }
                        .padding()
                        .background(.background)
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 16
                            )
                        )
                    }

                    Button {

                        session.phoneNumber = phoneNumber
                        session.sendVerificationCode()

                    } label: {

                        HStack {

                            Image(
                                systemName:
                                    "message.fill"
                            )

                            Text("Send Verification Code")
                                .fontWeight(.bold)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundStyle(.white)
                        .background(.blue.gradient)
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 18
                            )
                        )
                    }
                    .disabled(phoneNumber.isEmpty)
                    .opacity(
                        phoneNumber.isEmpty ? 0.5 : 1
                    )

                    HStack(
                        alignment: .top,
                        spacing: 10
                    ) {

                        Image(
                            systemName:
                                "lock.shield.fill"
                        )
                        .foregroundStyle(.green)

                        Text(
                            "Your phone number is used to verify your account. This prototype does not send a real SMS yet."
                        )
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    }
                    .padding()
                }
                .padding()
            }
            .background(
                Color(.systemGroupedBackground)
            )
        }
    }
}

#Preview {
    PhoneLoginView()
        .environmentObject(SessionManager())
}
