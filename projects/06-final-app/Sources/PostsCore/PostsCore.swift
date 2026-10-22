// Project 06: core logic — implement every TODO, then run `swift test`
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

// Review: lessons 04, 15, 24
public func validate(statusCode: Int) throws {
    // TODO: throw APIError.badStatus for anything outside 200...299
}

// Review: lesson 21
public func decodePosts(from data: Data) throws -> [Post] {
    return [] // TODO
}

// Review: lessons 22, 24
public func fetchPosts(limit: Int) async throws -> [Post] {
    // TODO: download https://jsonplaceholder.typicode.com/posts?_limit=N, validate the status, decode
    throw URLError(.badURL)
}

// Review: lessons 03, 10, 17
public func search(_ posts: [Post], for query: String) -> [Post] {
    return [] // TODO
}

// Review: lessons 07, 12, 19, 21
public struct Favorites: Codable, Equatable {
    public private(set) var ids: Set<Int> = []

    public init() {}

    public mutating func toggle(_ id: Int) {
        // TODO
    }

    public func contains(_ id: Int) -> Bool {
        return false // TODO
    }
}

// Review: lessons 08, 21, 25
public func saveFavorites(_ favorites: Favorites, to defaults: UserDefaults) {
    // TODO
}

public func loadFavorites(from defaults: UserDefaults) -> Favorites {
    return Favorites() // TODO
}
