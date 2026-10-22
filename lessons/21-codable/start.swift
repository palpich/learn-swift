// Lesson 21: Codable
// TODO
import Foundation

struct User: Codable {
    var id: Int
    var name: String
    var isActive: Bool
}

func encodeUser(_ user: User) throws -> String {
    return ""
}

func decodeUser(from json: String) throws -> User {
    throw NSError(domain: "todo", code: 1)
}

func decodeUsersSnakeCase(from json: String) throws -> [User] {
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
