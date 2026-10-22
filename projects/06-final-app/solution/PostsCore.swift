// Project 06: core logic solution
import Foundation

public struct Post: Codable, Identifiable, Equatable {
    public var userId: Int
    public var id: Int
    public var title: String
    public var body: String

    public init(userId: Int, id: Int, title: String, body: String) {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }
}

public enum APIError: Error, Equatable {
    case badStatus(Int)
}

public func validate(statusCode: Int) throws {
    guard (200...299).contains(statusCode) else {
        throw APIError.badStatus(statusCode)
    }
}

public func decodePosts(from data: Data) throws -> [Post] {
    try JSONDecoder().decode([Post].self, from: data)
}

public func fetchPosts(limit: Int) async throws -> [Post] {
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts?_limit=\(limit)")!
    let (data, response) = try await URLSession.shared.data(from: url)
    if let http = response as? HTTPURLResponse {
        try validate(statusCode: http.statusCode)
    }
    return try decodePosts(from: data)
}

public func search(_ posts: [Post], for query: String) -> [Post] {
    let text = query.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
    if text.isEmpty {
        return posts
    }
    return posts.filter { $0.title.lowercased().contains(text) }
}

public struct Favorites: Codable, Equatable {
    public private(set) var ids: Set<Int> = []

    public init() {}

    public mutating func toggle(_ id: Int) {
        if ids.contains(id) {
            ids.remove(id)
        } else {
            ids.insert(id)
        }
    }

    public func contains(_ id: Int) -> Bool {
        return ids.contains(id)
    }
}

public func saveFavorites(_ favorites: Favorites, to defaults: UserDefaults) {
    if let data = try? JSONEncoder().encode(favorites) {
        defaults.set(data, forKey: "favorites")
    }
}

public func loadFavorites(from defaults: UserDefaults) -> Favorites {
    guard let data = defaults.data(forKey: "favorites") else {
        return Favorites()
    }
    return (try? JSONDecoder().decode(Favorites.self, from: data)) ?? Favorites()
}
