# Урок 21 — Codable

## Цель

Кодировать и декодировать модели в JSON — базовый навык для API и файлов.

## Теория

```swift
struct User: Codable {
    var id: Int
    var name: String
}

let data = try JSONEncoder().encode(user)
let again = try JSONDecoder().decode(User.self, from: data)
```

Имена полей по умолчанию совпадают с ключами JSON. Для snake_case часто ставят `keyDecodingStrategy = .convertFromSnakeCase`.

## Задание

1. `struct User: Codable` с `id: Int`, `name: String`, `isActive: Bool`.
2. `func encodeUser(_ user: User) throws -> String` — JSON UTF-8 строка (без pretty print).
3. `func decodeUser(from json: String) throws -> User`.
4. `func decodeUsersSnakeCase(from json: String) throws -> [User]` — массив, ключи как `is_active`; настрой decoder strategy.

```bash
swift start.swift
```

## Подсказка

`String(data:encoding: .utf8)`, `JSONDecoder().keyDecodingStrategy = .convertFromSnakeCase`.

## Дальше по книге

[Encoding and Decoding](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/encodedecodable) · [Codable](https://developer.apple.com/documentation/swift/codable)
