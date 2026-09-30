import SwiftUI

struct ChatRoomView: View {

    let channel: ChatChannel

    @State private var message = ""

    var body: some View {
        VStack {

            ScrollView {
                VStack(spacing: 14) {

                    ChatBubble(
                        name: "Student",
                        text: "Hey everyone! 👋",
                        isMe: false
                    )

                    ChatBubble(
                        name: "You",
                        text: "What's happening on campus today?",
                        isMe: true
                    )

                    ChatBubble(
                        name: "Student",
                        text: "There's an event tonight 🎉",
                        isMe: false
                    )
                }
                .padding()
            }

            HStack {
                Button {
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.title2)
                }

                TextField("Message \(channel.name)", text: $message)
                    .padding(12)
                    .background(Color(.secondarySystemBackground))
                    .clipShape(Capsule())

                Button {
                    message = ""
                } label: {
                    Image(systemName: "arrow.up.circle.fill")
                        .font(.title)
                }
            }
            .padding()
        }
        .navigationTitle(channel.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ChatBubble: View {
    let name: String
    let text: String
    let isMe: Bool

    var body: some View {
        HStack {
            if isMe {
                Spacer()
            }

            VStack(alignment: isMe ? .trailing : .leading) {
                Text(name)
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Text(text)
                    .padding(12)
                    .background(
                        isMe
                        ? Color.purple
                        : Color(.secondarySystemBackground)
                    )
                    .foregroundStyle(isMe ? .white : .primary)
                    .clipShape(RoundedRectangle(cornerRadius: 18))
            }

            if !isMe {
                Spacer()
            }
        }
    }
}
