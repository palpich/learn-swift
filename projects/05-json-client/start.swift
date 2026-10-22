// Project 05: JSON client
// TODO
import Foundation

struct Post: Codable, Equatable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}

func fetchPosts(limit: Int) async throws -> [Post] {
    throw URLError(.badURL)
}

func savePosts(_ posts: [Post], to url: URL) throws {
}

func loadPosts(from url: URL) throws -> [Post] {
    throw URLError(.cannotOpenFile)
}

func check(_ name: String, _ ok: Bool, _ detail: String = "") {
    if ok {
        print("✓ \(name)")
    } else {
        print("✗ \(name)\(detail.isEmpty ? "" : ": \(detail)")")
        fatalError("проверка не прошла")
    }
}

func run() async {
    if CommandLine.arguments.contains("check") {
        let sample = [
            Post(userId: 1, id: 1, title: "A", body: "a"),
            Post(userId: 1, id: 2, title: "B", body: "b"),
        ]
        let url = FileManager.default.temporaryDirectory.appendingPathComponent("learn-swift-posts-check.json")
        try! savePosts(sample, to: url)
        let loaded = try! loadPosts(from: url)
        check("roundtrip", loaded == sample)
        print("Project 05: checks passed!")
        return
    }

    do {
        let posts = try await fetchPosts(limit: 5)
        let url = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
            .appendingPathComponent("posts.json")
        try savePosts(posts, to: url)
        let again = try loadPosts(from: url)
        print("Fetched and saved \(again.count) posts → \(url.path)")
    } catch {
        print("error: \(error)")
    }
}

let sem = DispatchSemaphore(value: 0)
Task {
    await run()
    sem.signal()
}
sem.wait()
