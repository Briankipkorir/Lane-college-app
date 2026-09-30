import SwiftUI

struct CafeteriaView: View {
    @StateObject private var service = CafeteriaService.shared
    @State private var period: MealPeriod = .lunch
    @State private var isLoading = false
    @State private var isPresentingRating = false
    @State private var selectedItem: MenuItem? = nil

    var body: some View {
        NavigationStack {
            VStack {
                Picker("Meal", selection: $period) {
                    ForEach(MealPeriod.allCases) { p in
                        Text(p.title).tag(p)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)

                if isLoading {
                    ProgressView("Loading menu…").padding()
                }

                List(filteredItems) { item in
                    NavigationLink(value: item) {
                        HStack(alignment: .top, spacing: 12) {
                            Image(systemName: icon(for: item.period))
                                .foregroundStyle(.tint)
                                .font(.title3)
                                .frame(width: 28)
                            VStack(alignment: .leading, spacing: 4) {
                                Text(item.name).font(.headline)
                                if let desc = item.description { Text(desc).font(.subheadline).foregroundStyle(.secondary) }
                                HStack(spacing: 6) {
                                    StarRow(rating: service.averageRating(for: item))
                                    Text(String(format: "%.1f", service.averageRating(for: item)))
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                            }
                            Spacer()
                            if let cal = item.calories {
                                Text("\(cal) cal")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .contextMenu {
                        Button { showRateSheet(item) } label: { Label("Rate", systemImage: "star") }
                    }
                }
                .navigationDestination(for: MenuItem.self) { item in
                    MenuItemDetailView(item: item)
                }
            }
            .navigationTitle("Cafeteria")
            .task { await load() }
            .sheet(isPresented: $isPresentingRating, onDismiss: {
                selectedItem = nil
            }) {
                if let selectedItem = selectedItem {
                    RatingSheet(item: selectedItem)
                }
            }
        }
    }

    private var filteredItems: [MenuItem] {
        service.todayMenu.items.filter { $0.period == period }
    }

    private func load() async {
        isLoading = true
        _ = try? await service.fetchTodayMenu()
        isLoading = false
    }

    private func icon(for period: MealPeriod) -> String {
        switch period {
        case .breakfast: return "sunrise.fill"
        case .lunch: return "fork.knife"
        case .dinner: return "moon.stars.fill"
        }
    }

    private func showRateSheet(_ item: MenuItem) {
        selectedItem = item
        isPresentingRating = true
    }
}

// MARK: - Detail
struct MenuItemDetailView: View {
    @ObservedObject private var service = CafeteriaService.shared
    let item: MenuItem
    @State private var isPresentingRating = false

    var body: some View {
        List {
            Section {
                HStack {
                    StarRow(rating: service.averageRating(for: item))
                    Text(String(format: "%.1f avg", service.averageRating(for: item)))
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                if let desc = item.description { Text(desc) }
                if let cal = item.calories { Text("Calories: \(cal)") }
                Button { isPresentingRating = true } label: { Label("Rate this item", systemImage: "star") }
            }

            Section("Recent Ratings") {
                let rs = service.ratings(for: item).sorted { $0.date > $1.date }
                if rs.isEmpty { Text("No ratings yet. Be the first!") }
                ForEach(rs) { r in
                    VStack(alignment: .leading, spacing: 4) {
                        StarRow(rating: Double(r.stars))
                        if let c = r.comment, !c.isEmpty { Text(c) }
                        Text(r.date.formatted(date: .abbreviated, time: .shortened))
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
        .navigationTitle(item.name)
        .sheet(isPresented: $isPresentingRating) {
            RatingSheet(item: item)
        }
    }
}

// MARK: - Rating Sheet
struct RatingSheet: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var service = CafeteriaService.shared
    let item: MenuItem

    @State private var stars: Int = 5
    @State private var comment: String = ""
    @State private var isSubmitting = false

    var body: some View {
        NavigationStack {
            Form {
                Section("Your Rating") {
                    Stepper(value: $stars, in: 1...5) {
                        HStack {
                            StarRow(rating: Double(stars))
                            Text("\(stars) / 5")
                        }
                    }
                    TextField("Optional comment", text: $comment, axis: .vertical)
                        .lineLimit(3, reservesSpace: true)
                }
            }
            .navigationTitle("Rate \(item.name)")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Submit") { Task { await submit() } }
                        .disabled(isSubmitting)
                }
            }
        }
    }

    private func submit() async {
        isSubmitting = true
        defer { isSubmitting = false }
        try? await service.submitRating(for: item, stars: stars, comment: comment.isEmpty ? nil : comment)
        dismiss()
    }
}

// MARK: - Star Row
struct StarRow: View {
    let rating: Double
    private let maxStars = 5

    var body: some View {
        HStack(spacing: 2) {
            ForEach(0..<maxStars, id: \.self) { idx in
                let filled = Double(idx) < floor(rating)
                let half = !filled && Double(idx) < rating
                Image(systemName: filled ? "star.fill" : (half ? "star.leadinghalf.filled" : "star"))
                    .foregroundStyle(.yellow)
            }
        }
        .accessibilityLabel("Rating \(String(format: "%.1f", rating)) out of 5")
    }
}

#Preview { NavigationStack { CafeteriaView() } }
