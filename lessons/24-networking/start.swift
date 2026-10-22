// Lesson 24: networking
// TODO
import Foundation

struct Post: Codable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}

func decodePosts(from data: Data) throws -> [Post] {
    throw NSError(domain: "todo", code: 1)
}

func fetchPosts(from url: URL) async throws -> [Post] {
    throw NSError(domain: "todo", code: 1)
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
        let sample = """
        [
          {"userId":1,"id":1,"title":"Hello","body":"World"},
          {"userId":1,"id":2,"title":"Swift","body":"Rocks"}
        ]
        """.data(using: .utf8)!
        let posts = try! decodePosts(from: sample)
        check("count", posts.count == 2)
        check("title", posts[0].title == "Hello")
        print("Урок 24 пройден!")
        return
    }

    let url = URL(string: "https://jsonplaceholder.typicode.com/posts?_limit=3")!
    do {
        let posts = try await fetchPosts(from: url)
        for p in posts {
            print("- \(p.id): \(p.title)")
        }
    } catch {
        print("network error: \(error)")
    }
}

let sem = DispatchSemaphore(value: 0)
Task {
    await run()
    sem.signal()
}
sem.wait()
