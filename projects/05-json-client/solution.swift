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

func postsPerUser(_ posts: [Post]) -> [Int: Int] {
    var result: [Int: Int] = [:]
    for post in posts {
        result[post.userId, default: 0] += 1
    }
    return result
}

// --- checks and main program: no need to edit below this line ---
nonisolated(unsafe) var failures = 0

func check(_ name: String, _ ok: Bool, _ detail: String = "") {
    if ok {
        print("✓ \(name)")
    } else {
        failures += 1
        print("✗ \(name)\(detail.isEmpty ? "" : ": \(detail)")")
    }
}

func check<T: Equatable>(_ name: String, _ actual: T, _ expected: T) {
    check(name, actual == expected, "получили \(actual), ждали \(expected)")
}

func finish(_ title: String) {
    if failures == 0 {
        print("\(title) пройден!")
    } else {
        print("\(title): не прошло проверок — \(failures). Исправь код и запусти снова.")
        exit(1)
    }
}

func run() async {
    if CommandLine.arguments.contains("check") {
        let sample = [
            Post(userId: 1, id: 1, title: "A", body: "a"),
            Post(userId: 1, id: 2, title: "B", body: "b"),
            Post(userId: 2, id: 3, title: "C", body: "c"),
        ]
        let url = FileManager.default.temporaryDirectory.appendingPathComponent("learn-swift-posts-check.json")
        do {
            try savePosts(sample, to: url)
            let loaded = try loadPosts(from: url)
            check("roundtrip", loaded, sample)
        } catch {
            check("save and load without errors", false, "\(error)")
        }
        check("posts per user", postsPerUser(sample), [1: 2, 2: 1])
        finish("Проект 05")
        return
    }

    do {
        let posts = try await fetchPosts(limit: 5)
        let url = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
            .appendingPathComponent("posts.json")
        try savePosts(posts, to: url)
        let again = try loadPosts(from: url)
        print("Fetched and saved \(again.count) posts → \(url.path)")
        for (user, count) in postsPerUser(again).sorted(by: { $0.key < $1.key }) {
            print("User \(user): \(count) posts")
        }
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
