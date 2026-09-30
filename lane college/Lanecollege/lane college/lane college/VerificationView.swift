import SwiftUI

struct VerificationView: View {

    @EnvironmentObject var session: SessionManager

    @State private var code = ""
    @State private var showError = false

    var body: some View {

        NavigationStack {

            ScrollView {

                VStack(spacing: 28) {

                    // DRAGON

                    Image("LaneDragon")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 230)
                        .padding(.top, 30)


                    // TITLE

                    VStack(spacing: 8) {

                        Text("Check Your Phone")
                            .font(.largeTitle.bold())

                        Text("We sent a 6-digit verification code to")
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)

                        Text(displayPhoneNumber)
                            .font(.headline)
                            .foregroundStyle(.blue)
                    }


                    // MESSAGE ICON

                    Image(systemName: "message.badge.filled.fill")
                        .font(.system(size: 45))
                        .foregroundStyle(.blue)
                        .padding()
                        .background(
                            Circle()
                                .fill(.blue.opacity(0.12))
                        )


                    // CODE FIELD

                    VStack(alignment: .leading, spacing: 10) {

                        Text("Verification Code")
                            .font(.headline)

                        TextField(
                            "Enter 6-digit code",
                            text: $code
                        )
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.center)
                        .font(.title2.bold())
                        .padding()
                        .background(.background)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 16)
                        )
                        .onChange(of: code) { _, newValue in

                            let numbersOnly =
                                newValue.filter { $0.isNumber }

                            code = String(
                                numbersOnly.prefix(6)
                            )
                        }
                    }


                    // VERIFY BUTTON

                    Button {

                        if session.verifyCode(code) {

                            showError = false

                        } else {

                            showError = true
                        }

                    } label: {

                        HStack {

                            Image(
                                systemName:
                                    "checkmark.shield.fill"
                            )

                            Text("Verify Phone")
                                .fontWeight(.bold)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundStyle(.white)
                        .background(.blue.gradient)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 18)
                        )
                    }
                    .disabled(code.count != 6)
                    .opacity(code.count == 6 ? 1 : 0.5)


                    // ERROR

                    if showError {

                        HStack {

                            Image(
                                systemName:
                                    "exclamationmark.triangle.fill"
                            )

                            Text(
                                "Incorrect verification code. Try again."
                            )
                        }
                        .font(.caption)
                        .foregroundStyle(.red)
                    }


                    // PROTOTYPE NOTICE

                    VStack(spacing: 6) {

                        Text("Prototype Testing")
                            .font(.caption.bold())

                        Text("Use verification code 123456")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.yellow.opacity(0.12))
                    .clipShape(
                        RoundedRectangle(cornerRadius: 15)
                    )
                }
                .padding()
            }
            .background(
                Color(.systemGroupedBackground)
            )
        }
    }


    // MARK: - DISPLAY PHONE

    private var displayPhoneNumber: String {

        if session.phoneNumber.isEmpty {
            return "your phone"
        }

        return "+1 \(session.phoneNumber)"
    }
}


#Preview {

    VerificationView()
        .environmentObject(SessionManager())
}
