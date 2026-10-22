// Lesson 21: solution
import Foundation

enum Role: String, Codable {
    case admin
    case member
}

struct User: Codable {
    var id: Int
    var name: String
    var isActive: Bool
    var role: Role
}

func encodeUser(_ user: User) throws -> String {
    let data = try JSONEncoder().encode(user)
    guard let s = String(data: data, encoding: .utf8) else {
        throw NSError(domain: "encode", code: 1)
    }
    return s
}

func decodeUser(from json: String) throws -> User {
    guard let data = json.data(using: .utf8) else {
        throw NSError(domain: "decode", code: 1)
    }
    return try JSONDecoder().decode(User.self, from: data)
}

func decodeUsersSnakeCase(from json: String) throws -> [User] {
    guard let data = json.data(using: .utf8) else {
        throw NSError(domain: "decode", code: 1)
    }
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return try decoder.decode([User].self, from: data)
}

func activeNames(_ users: [User]) -> [String] {
    return users.filter { $0.isActive }.map { $0.name }.sorted()
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

let user = User(id: 1, name: "Ada", isActive: true, role: .member)
let encoded = (try? encodeUser(user)) ?? ""
let decoded = try? decodeUser(from: encoded)
check("roundtrip name", decoded?.name, "Ada")
check("roundtrip active", decoded?.isActive, true)
check("roundtrip role", decoded?.role, Role.member)

let snake = """
[
  {"id": 2, "name": "Bob", "is_active": false, "role": "member"},
  {"id": 3, "name": "Cleo", "is_active": true, "role": "admin"}
]
"""
let list = (try? decodeUsersSnakeCase(from: snake)) ?? []
check("snake count", list.count, 2)
check("snake flag", list.first?.isActive, false)
check("active names", activeNames(list + [user]), ["Ada", "Cleo"])
finish("Урок 21")
