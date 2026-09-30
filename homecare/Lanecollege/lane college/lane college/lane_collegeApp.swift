import SwiftUI

@main
struct lane_collegeApp: App {

    @StateObject private var session = SessionManager()

    var body: some Scene {

        WindowGroup {

            RootView()
                .environmentObject(session)
        }
    }
}
