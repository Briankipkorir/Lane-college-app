import SwiftUI

struct LoginView: View {

    @EnvironmentObject var session: SessionManager

    var body: some View {

        NavigationStack {

            ScrollView {

                VStack(spacing: 28) {

                    dragonHeader

                    welcomeSection

                    roleSelector

                    accountInformation

                    signInButton

                    securityNotice
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
        }
    }


    // MARK: - DRAGON HEADER

    private var dragonHeader: some View {

        VStack(spacing: 12) {

            ZStack {

                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.blue, .red],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 125, height: 125)

                Image(systemName: "flame.fill")
                    .font(.system(size: 60))
                    .foregroundStyle(.white)
            }

            Text("LANE COLLEGE")
                .font(.largeTitle.bold())

            Text("DRAGONS")
                .font(.title2.bold())
                .foregroundStyle(.blue)

            Text("The Next Level of Excellence")
                .font(.headline)
                .foregroundStyle(.secondary)
        }
        .padding(.top, 30)
    }


    // MARK: - WELCOME

    private var welcomeSection: some View {

        VStack(spacing: 8) {

            Text("Welcome to Lane")
                .font(.title.bold())

            Text(
                "One account for your Lane College experience."
            )
            .foregroundStyle(.secondary)
            .multilineTextAlignment(.center)
        }
    }


    // MARK: - ROLE

    private var roleSelector: some View {

        VStack(alignment: .leading, spacing: 14) {

            Text("I am a")
                .font(.headline)

            HStack(spacing: 10) {

                ForEach(UserRole.allCases) { role in

                    Button {

                        session.selectedRole = role

                    } label: {

                        VStack(spacing: 8) {

                            Image(systemName: role.icon)
                                .font(.title2)

                            Text(role.rawValue)
                                .font(.caption.bold())
                        }
                        .foregroundStyle(
                            session.selectedRole == role
                            ? Color.white
                            : role.color
                        )
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 15)
                        .background(
                            session.selectedRole == role
                            ? role.color
                            : role.color.opacity(0.12)
                        )
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 18
                            )
                        )
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }


    // MARK: - ACCOUNT INFORMATION

    private var accountInformation: some View {

        VStack(spacing: 15) {

            HStack {

                Image(systemName: "person.fill")
                    .foregroundStyle(.blue)

                TextField(
                    "Full Name",
                    text: $session.fullName
                )
            }
            .padding()
            .background(.background)
            .clipShape(
                RoundedRectangle(cornerRadius: 16)
            )


            HStack {

                Image(systemName: "envelope.fill")
                    .foregroundStyle(.purple)

                TextField(
                    "Lane College Email",
                    text: $session.laneEmail
                )
                .textInputAutocapitalization(.never)
                .keyboardType(.emailAddress)
            }
            .padding()
            .background(.background)
            .clipShape(
                RoundedRectangle(cornerRadius: 16)
            )
        }
    }


    // MARK: - SIGN IN

    private var signInButton: some View {

        Button {

            session.signIn()

        } label: {

            HStack {

                Image(systemName: "person.crop.circle.badge.checkmark")

                Text("Continue as \(session.selectedRole.rawValue)")
                    .fontWeight(.bold)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundStyle(.white)
            .background(
                session.selectedRole.color.gradient
            )
            .clipShape(
                RoundedRectangle(cornerRadius: 18)
            )
        }
        .disabled(session.fullName.isEmpty)
        .opacity(
            session.fullName.isEmpty ? 0.5 : 1
        )
    }


    // MARK: - SECURITY

    private var securityNotice: some View {

        HStack(alignment: .top, spacing: 10) {

            Image(systemName: "lock.shield.fill")
                .foregroundStyle(.green)

            Text(
                "Prototype sign-in. This app does not request or store your real Lane College password. An official release would use Lane College's approved authentication system."
            )
            .font(.caption)
            .foregroundStyle(.secondary)
        }
        .padding()
    }
}


#Preview {

    LoginView()
        .environmentObject(SessionManager())
}
