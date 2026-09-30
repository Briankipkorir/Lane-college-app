import SwiftUI

struct ChatChannel: Identifiable {

    let id = UUID()
    let name: String
    let message: String
    let icon: String
    let unread: Int
}

struct ChatView: View {

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
            icon: "calendar",
            unread: 2
        ),

        ChatChannel(
            name: "Sports",
            message: "Game day! 🏃",
            icon: "figure.run",
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

                        Image(systemName: channel.icon)
                            .font(.title2)
                            .frame(width: 48, height: 48)
                            .foregroundStyle(.white)
                            .background(.purple.gradient)
                            .clipShape(Circle())

                        VStack(alignment: .leading, spacing: 4) {

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
                                .font(.caption.bold())
                                .foregroundStyle(.white)
                                .padding(7)
                                .background(.red)
                                .clipShape(Circle())
                        }
                    }
                    .padding(.vertical, 5)
                }
            }
            .navigationTitle("Campus Chat 💬")
        }
    }
}


struct MessageBubble: View {

    let text: String
    let isMe: Bool

    var body: some View {

        HStack {

            if isMe {
                Spacer()
            }

            Text(text)
                .padding()
                .foregroundStyle(isMe ? .white : .primary)
                .background(
                    isMe
                    ? Color.purple
                    : Color(.secondarySystemBackground)
                )
                .clipShape(RoundedRectangle(cornerRadius: 18))

            if !isMe {
                Spacer()
            }
        }
    }
}

#Preview {
    ChatView()
}
