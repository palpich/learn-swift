# Урок 24 — Networking (URLSession)

## Цель

Скачать данные по HTTP через `URLSession` и разобрать JSON (`async`).

## Теория

```swift
let (data, response) = try await URLSession.shared.data(from: url)
guard let http = response as? HTTPURLResponse, (200...299).contains(http.statusCode) else { ... }
let posts = try JSONDecoder().decode([Post].self, from: data)
```

В режиме `check` сеть не нужна — проверяются разбор JSON и проверка статус-кода.

## Задание

1. `struct Post: Codable` — `userId`, `id`, `title`, `body`.
2. `func decodePosts(from data: Data) throws -> [Post]`.
3. `func fetchPosts(from url: URL) async throws -> [Post]` — используй `validate(statusCode:)` для ответа сервера.

```bash
swift start.swift check
swift start.swift          # реальный запрос
```

## Повторение

Пригодятся диапазоны из [урока 04](../04-conditionals), связанные значения из [урока 11](../11-enumerations) и `throws` из [урока 15](../15-errors).

4. `enum APIError: Error` с кейсом `badStatus(Int)`.
5. `validate(statusCode:) throws` — коды `200...299` пропускай, на любой другой брось `APIError.badStatus` с этим кодом. Такую функцию можно проверить без сети — именно это делает режим `check`.

## Дальше по докам

[URLSession](https://developer.apple.com/documentation/foundation/urlsession)
