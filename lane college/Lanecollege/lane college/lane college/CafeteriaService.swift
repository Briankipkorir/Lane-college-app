import Foundation
import Combine

@MainActor
final class CafeteriaService: ObservableObject {
    static let shared = CafeteriaService()

    @Published private(set) var todayMenu: DailyMenu
    @Published private(set) var ratings: [UUID: [Rating]] // key: MenuItem.id

    private init() {
        let items: [MenuItem] = [
            MenuItem(name: "Pancakes", description: "Fluffy with maple syrup", period: .breakfast, calories: 350),
            MenuItem(name: "Scrambled Eggs", description: "Farm fresh", period: .breakfast, calories: 200),
            MenuItem(name: "Grilled Chicken", description: "With steamed veggies", period: .lunch, calories: 520),
            MenuItem(name: "Veggie Wrap", description: "Hummus & greens", period: .lunch, calories: 430),
            MenuItem(name: "Spaghetti Bolognese", description: "Classic tomato meat sauce", period: .dinner, calories: 680),
            MenuItem(name: "Garden Salad", description: "Light vinaigrette", period: .dinner, calories: 210)
        ]
        self.todayMenu = DailyMenu(date: Date(), items: items)
        self.ratings = [:]
    }

    func fetchTodayMenu() async throws -> DailyMenu {
        try await Task.sleep(nanoseconds: 150_000_000)
        return todayMenu
    }

    func ratings(for item: MenuItem) -> [Rating] {
        ratings[item.id] ?? []
    }

    func averageRating(for item: MenuItem) -> Double {
        let rs = ratings(for: item)
        guard !rs.isEmpty else { return 0 }
        let total = rs.reduce(0) { $0 + $1.stars }
        return Double(total) / Double(rs.count)
    }

    func submitRating(for item: MenuItem, stars: Int, comment: String?) async throws {
        try await Task.sleep(nanoseconds: 120_000_000)
        let rating = Rating(itemID: item.id, stars: stars, comment: comment)
        var arr = ratings[item.id] ?? []
        arr.append(rating)
        ratings[item.id] = arr
        objectWillChange.send()
    }
}

