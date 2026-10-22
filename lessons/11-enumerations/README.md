# Урок 11 — Перечисления

## Цель

Моделировать фиксированный набор вариантов через `enum`.

## Теория

```swift
enum Direction: String {
    case north = "N"
    case south = "S"
}

enum Result {
    case success(Int)
    case failure(String)
}
```

Сырые значения (`rawValue`) и связанные значения (`associated values`) решают разные задачи.

## Задание

Дан enum `Command` с кейсами `forward`, `back`, `left`, `right`.

1. Добавь сырой тип `String` и сырые значения `"F"`, `"B"`, `"L"`, `"R"`.
2. `code(_ command:)` — верни `rawValue`.
3. `fromCode(_:)` — создай `Command?` из строки (`nil`, если неизвестно).
4. `describe(_ result:)` для enum `DownloadResult` с кейсами `ok(bytes: Int)` и `fail(reason: String)`:
   - ok → `"downloaded: N bytes"`
   - fail → `"error: ..."`

```bash
swift start.swift
```

## Подсказка

`Command(rawValue: code)` и `switch` по `DownloadResult`.

## Дальше по книге

[Enumerations](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/enumerations)
