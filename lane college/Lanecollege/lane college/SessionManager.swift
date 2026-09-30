import SwiftUI
import Combine

@MainActor
final class SessionManager: ObservableObject {

    // MARK: - SIGN IN STATE

    @Published var isSignedIn: Bool = false
    @Published var verificationCodeSent: Bool = false
    @Published var phoneVerified: Bool = false

    // MARK: - USER INFORMATION

    @Published var selectedRole: UserRole = .student
    @Published var fullName: String = ""
    @Published var laneEmail: String = ""
    @Published var phoneNumber: String = ""

    // MARK: - PHONE VERIFICATION

    func sendVerificationCode() {

        guard !phoneNumber.isEmpty else {
            return
        }

        // Prototype only.
        // Later this will call the real SMS authentication service.
        verificationCodeSent = true
    }

    func verifyCode(_ code: String) -> Bool {

        // Prototype verification code.
        // DO NOT use this method for production authentication.
        if code == "123456" {

            phoneVerified = true
            return true
        }

        return false
    }

    // MARK: - SIGN IN

    func signIn() {

        guard phoneVerified else {
            return
        }

        guard !fullName.isEmpty else {
            return
        }

        isSignedIn = true
    }

    // MARK: - SIGN OUT

    func signOut() {

        isSignedIn = false
        verificationCodeSent = false
        phoneVerified = false

        fullName = ""
        laneEmail = ""
        phoneNumber = ""

        selectedRole = .student
    }
}
