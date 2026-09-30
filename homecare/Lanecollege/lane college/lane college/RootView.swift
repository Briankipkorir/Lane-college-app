import SwiftUI

struct RootView: View {

    @EnvironmentObject var session: SessionManager

    var body: some View {

        Group {

            // 1. USER IS COMPLETELY SIGNED IN
            if session.isSignedIn {

                ContentView()


            // 2. PHONE HAS BEEN VERIFIED
            // NOW COMPLETE THE LANE PROFILE
            } else if session.phoneVerified {

                LoginView()


            // 3. CODE HAS BEEN SENT
            // USER MUST VERIFY PHONE
            } else if session.verificationCodeSent {

                VerificationView()


            // 4. FIRST SCREEN
            // ENTER PHONE NUMBER
            } else {

                PhoneLoginView()
            }
        }
        .animation(
            .easeInOut(duration: 0.35),
            value: session.isSignedIn
        )
        .animation(
            .easeInOut(duration: 0.35),
            value: session.phoneVerified
        )
        .animation(
            .easeInOut(duration: 0.35),
            value: session.verificationCodeSent
        )
    }
}


#Preview {

    RootView()
        .environmentObject(SessionManager())
}
