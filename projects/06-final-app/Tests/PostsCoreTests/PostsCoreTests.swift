import Foundation
import Testing
import PostsCore

let sampleJSON = """
[
  {"userId": 1, "id": 1, "title": "Hello Swift", "body": "First post"},
  {"userId": 2, "id": 2, "title": "Async await", "body": "Second post"}
]
"""

@Test func statusCodes() throws {
    try validate(statusCode: 200)
    try validate(statusCode: 204)
    #expect(throws: APIError.badStatus(404)) {
        try validate(statusCode: 404)
    }
    #expect(throws: APIError.badStatus(500)) {
        try validate(statusCode: 500)
    }
}

@Test func decoding() throws {
    let posts = try decodePosts(from: Data(sampleJSON.utf8))
    #expect(posts.count == 2)
    #expect(posts.first?.title == "Hello Swift")
}

@Test func searching() throws {
    let posts = try decodePosts(from: Data(sampleJSON.utf8))
    #expect(search(posts, for: "").count == 2)
    #expect(search(posts, for: "   ").count == 2)
    #expect(search(posts, for: "swift").map(\.id) == [1])
    #expect(search(posts, for: " ASYNC ").map(\.id) == [2])
    #expect(search(posts, for: "kotlin").isEmpty)
}

@Test func favoritesToggle() {
    var favorites = Favorites()
    #expect(!favorites.contains(1))
    favorites.toggle(1)
    #expect(favorites.contains(1))
    favorites.toggle(1)
    #expect(!favorites.contains(1))
}

@Test func favoritesPersist() throws {
    let suite = "learn.swift.final-app.tests"
    let defaults = try #require(UserDefaults(suiteName: suite))
    defaults.removePersistentDomain(forName: suite)
    #expect(loadFavorites(from: defaults) == Favorites())

    var favorites = Favorites()
    favorites.toggle(3)
    favorites.toggle(7)
    saveFavorites(favorites, to: defaults)
    #expect(loadFavorites(from: defaults) == favorites)
}
