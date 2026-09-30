import SwiftUI

struct AppearanceSettingsView: View {

    @AppStorage("fontStyle") private var fontStyle = "Default"

    let fonts = [
        "Default",
        "Rounded",
        "Serif",
        "Monospaced"
    ]

    var body: some View {
        Form {
            Section("Font Style") {
                Picker("Font", selection: $fontStyle) {
                    ForEach(fonts, id: \.self) { font in
                        Text(font)
                    }
                }
            }

            Section("Preview") {
                Text("Lane College")
                    .font(previewFont(size: 28))
                    .fontWeight(.bold)

                Text("Make campus life easier, connected and fun.")
                    .font(previewFont(size: 17))
            }

            Section {
                Text(
                    "We'll apply your selected font throughout more of the app as we build the design system."
                )
                .font(.caption)
                .foregroundStyle(.secondary)
            }
        }
        .navigationTitle("Appearance 🎨")
    }

    private func previewFont(size: CGFloat) -> Font {
        switch fontStyle {
        case "Rounded":
            return .system(size: size, design: .rounded)

        case "Serif":
            return .system(size: size, design: .serif)

        case "Monospaced":
            return .system(size: size, design: .monospaced)

        default:
            return .system(size: size)
        }
    }
}
