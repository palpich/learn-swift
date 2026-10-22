# Project 05 — JSON client

После уроков 21–24.

## Цель

CLI-клиент: скачать посты, сохранить в файл, прочитать обратно (Codable + URLSession + async).

## Задание

1. Используй `Post` (`userId`, `id`, `title`, `body`).
2. `func fetchPosts(limit: Int) async throws -> [Post]` — jsonplaceholder `posts?_limit=`.
3. `func savePosts(_ posts: [Post], to url: URL) throws` — JSON file.
4. `func loadPosts(from url: URL) throws -> [Post]`.
5. Режим `check` — только save/load roundtrip на локальных данных (без сети).

```bash
swift start.swift check
swift start.swift          # fetch 5 posts → posts.json → print count
```

## Подсказка

`JSONEncoder().outputFormatting = [.prettyPrinted, .sortedKeys]` удобно для файла.
