import Foundation

enum MealPeriod: String, CaseIterable, Codable, Identifiable {
    case breakfast, lunch, dinner
    var id: String { rawValue }

    var title: String {
        switch self {
        case .breakfast: return "Breakfast"
        case .lunch: return "Lunch"
        case .dinner: return "Dinner"
        }
    }
}

struct Rating: Identifiable, Codable, Hashable {
    let id: UUID
    let itemID: UUID
    var stars: Int // 1...5
    var comment: String?
    var date: Date

    init(id: UUID = UUID(), itemID: UUID, stars: Int, comment: String? = nil, date: Date = Date()) {
        self.id = id
        self.itemID = itemID
        self.stars = max(1, min(5, stars))
        self.comment = comment
        self.date = date
    }
}

struct MenuItem: Identifiable, Codable, Hashable {
    let id: UUID
    var name: String
    var description: String?
    var period: MealPeriod
    var calories: Int?

    init(id: UUID = UUID(), name: String, description: String? = nil, period: MealPeriod, calories: Int? = nil) {
        self.id = id
        self.name = name
        self.description = description
        self.period = period
        self.calories = calories
    }
}

struct DailyMenu: Identifiable, Codable {
    let id: UUID
    var date: Date
    var items: [MenuItem]

    init(id: UUID = UUID(), date: Date, items: [MenuItem]) {
        self.id = id
        self.date = date
        self.items = items
    }
}

extension DailyMenu {
    var averageCalories: Double? {
        let calories = items.compactMap { $0.calories }
        guard !calories.isEmpty else { return nil }
        return Double(calories.reduce(0, +)) / Double(calories.count)
    }
}

extension MenuItem {
    func averageRating(from ratings: [Rating]) -> Double? {
        let itemRatings = ratings.filter { $0.itemID == self.id }
        guard !itemRatings.isEmpty else { return nil }
        let total = itemRatings.reduce(0) { $0 + $1.stars }
        return Double(total) / Double(itemRatings.count)
    }
}
