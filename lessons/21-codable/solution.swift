// Lesson 21: solution
import Foundation

struct User: Codable {
    var id: Int
    var name: String
    var isActive: Bool
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

func check(_ name: String, _ ok: Bool, _ detail: String = "") {
    if ok {
        print("✓ \(name)")
    } else {
        print("✗ \(name)\(detail.isEmpty ? "" : ": \(detail)")")
        fatalError("проверка не прошла")
    }
}

let user = User(id: 1, name: "Ada", isActive: true)
let encoded = try! encodeUser(user)
check("roundtrip name", try! decodeUser(from: encoded).name == "Ada")
check("roundtrip active", try! decodeUser(from: encoded).isActive == true)

let snake = """
[{"id":2,"name":"Bob","is_active":false}]
"""
let list = try! decodeUsersSnakeCase(from: snake)
check("snake count", list.count == 1)
check("snake flag", list[0].isActive == false)
print("Урок 21 пройден!")
