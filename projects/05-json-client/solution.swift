// Project 05: solution
import Foundation

struct Post: Codable, Equatable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}

func fetchPosts(limit: Int) async throws -> [Post] {
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts?_limit=\(limit)")!
    let (data, response) = try await URLSession.shared.data(from: url)
    if let http = response as? HTTPURLResponse, !(200...299).contains(http.statusCode) {
        throw URLError(.badServerResponse)
    }
    return try JSONDecoder().decode([Post].self, from: data)
}

func savePosts(_ posts: [Post], to url: URL) throws {
    let encoder = JSONEncoder()
    encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
    let data = try encoder.encode(posts)
    try data.write(to: url)
}

func loadPosts(from url: URL) throws -> [Post] {
    let data = try Data(contentsOf: url)
    return try JSONDecoder().decode([Post].self, from: data)
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
