// Lesson 24: networking
// TODO
import Foundation

struct Post: Codable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}

// Review: lessons 04, 11, 15 (ranges, associated values, throws)
enum APIError: Error {
    // TODO: badStatus(Int)
}

func validate(statusCode: Int) throws {
    // TODO: throw APIError.badStatus for anything outside 200...299
}

func decodePosts(from data: Data) throws -> [Post] {
    throw NSError(domain: "todo", code: 1)
}

func fetchPosts(from url: URL) async throws -> [Post] {
    throw NSError(domain: "todo", code: 1)
}

// --- checks: no need to edit below this line ---
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

func errorText(_ work: () throws -> Void) -> String {
    do {
        try work()
        return "no error"
    } catch {
        return "\(error)"
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
        let posts = (try? decodePosts(from: sample)) ?? []
        check("count", posts.count, 2)
        check("title", posts.first?.title, "Hello")
        check("status 200", errorText { try validate(statusCode: 200) }, "no error")
        check("status 404", errorText { try validate(statusCode: 404) }, "badStatus(404)")
        check("status 500", errorText { try validate(statusCode: 500) }, "badStatus(500)")
        finish("Урок 24")
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
