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

## Повторение

Пригодятся строки из [урока 03](../03-strings) и опционалы с `guard` из [урока 08](../08-optionals).

6. `parseVersion(_:) -> Version?` — разбери строку `"1.10"` в `Version(major: 1, minor: 10)`. Если частей не две или это не числа — верни `nil`.
7. `latest(_:) -> Version?` — самая новая версия или `nil` для пустого массива.

## Подсказка

`text.split(separator: ".")` даёт массив частей, каждую превращай через `Int(...)`. Раз `Version` — `Comparable`, у массива версий есть `max()`.

## Дальше по книге

[Equatable](https://developer.apple.com/documentation/swift/equatable) · [Hashable](https://developer.apple.com/documentation/swift/hashable) · [Comparable](https://developer.apple.com/documentation/swift/comparable)
