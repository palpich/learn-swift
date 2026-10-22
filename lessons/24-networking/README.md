# Урок 24 — Networking (URLSession)

## Цель

Скачать данные по HTTP через `URLSession` и разобрать JSON (`async`).

## Теория

```swift
let (data, response) = try await URLSession.shared.data(from: url)
guard let http = response as? HTTPURLResponse, (200...299).contains(http.statusCode) else { ... }
let posts = try JSONDecoder().decode([Post].self, from: data)
```

В режиме `check` сеть не нужна — проверяется только decode.

## Задание

1. `struct Post: Codable` — `userId`, `id`, `title`, `body`.
2. `func decodePosts(from data: Data) throws -> [Post]`.
3. `func fetchPosts(from url: URL) async throws -> [Post]`.

```bash
swift start.swift check
swift start.swift          # реальный запрос
```

## Дальше по докам

[URLSession](https://developer.apple.com/documentation/foundation/urlsession)
