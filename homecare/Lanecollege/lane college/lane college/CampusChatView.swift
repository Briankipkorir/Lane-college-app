import SwiftUI

struct CampusChatView: View {

    private let channels = [
        ChatChannel(
            name: "Lane College Community",
            message: "What's happening on campus today?",
            icon: "person.3.fill",
            unread: 8
        ),

        ChatChannel(
            name: "Computer Science",
            message: "Anyone working on the assignment?",
            icon: "laptopcomputer",
            unread: 3
        ),

        ChatChannel(
            name: "Class of 2027",
            message: "Study session tonight 📚",
            icon: "graduationcap.fill",
            unread: 5
        ),

        ChatChannel(
            name: "Campus Events",
            message: "Don't miss Friday's event 🎉",
            icon: "party.popper.fill",
            unread: 2
        ),

        ChatChannel(
            name: "Sports",
            message: "Game day! 🏃🏽‍♂️🔥",
            icon: "sportscourt.fill",
            unread: 0
        )
    ]

    var body: some View {
        NavigationStack {
            List(channels) { channel in
                NavigationLink {
                    ChatRoomView(channel: channel)
                } label: {
                    HStack(spacing: 14) {

                        ZStack {
                            Circle()
                                .fill(
                                    LinearGradient(
                                        colors: [.purple, .blue],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .frame(width: 52, height: 52)

                            Image(systemName: channel.icon)
                                .foregroundStyle(.white)
                                .font(.title3)
                        }

                        VStack(alignment: .leading, spacing: 5) {
                            Text(channel.name)
                                .font(.headline)

                            Text(channel.message)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                                .lineLimit(1)
                        }

                        Spacer()

                        if channel.unread > 0 {
                            Text("\(channel.unread)")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                                .padding(7)
                                .background(.purple)
                                .clipShape(Circle())
                        }
                    }
                    .padding(.vertical, 6)
                }
            }
            .navigationTitle("Campus Chat 💬")
        }
    }
}
