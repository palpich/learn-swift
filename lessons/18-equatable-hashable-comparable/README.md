# Урок 18 — Equatable, Hashable, Comparable

## Цель

Научить свои типы сравниваться, лежать в `Set`/`Dictionary` и сортироваться.

## Теория

```swift
struct Point: Equatable, Hashable, Comparable {
    var x: Int
    var y: Int
    static func < (lhs: Point, rhs: Point) -> Bool {
        if lhs.x != rhs.x { return lhs.x < rhs.x }
        return lhs.y < rhs.y
    }
}
```

Для `struct` с `Equatable`/`Hashable` свойствами синтез часто бесплатный. `Comparable` — метод `<` пишешь сам.

## Задание

1. `struct Version: Equatable, Comparable` с `major`, `minor`.
2. `==` — оба поля равны (можно синтезировать, оставь `Equatable` без своего `==`).
3. `<` — сначала `major`, при равенстве — `minor`.
4. `func sortedVersions(_ items: [Version]) -> [Version]` — отсортируй по возрастанию.
5. `struct Tag: Hashable` с `name: String` — положи два одинаковых тега в `Set`, размер должен быть 1.

```bash
swift start.swift
```

## Дальше по книге

[Equatable](https://developer.apple.com/documentation/swift/equatable) · [Hashable](https://developer.apple.com/documentation/swift/hashable) · [Comparable](https://developer.apple.com/documentation/swift/comparable)
