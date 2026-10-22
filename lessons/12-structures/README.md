# Урок 12 — Структуры

## Цель

Описать тип-значение со свойствами, методом и `mutating`.

## Теория

```swift
struct Point {
    var x: Int
    var y: Int

    var label: String {
        return "(\(x), \(y))"
    }

    mutating func move(dx: Int, dy: Int) {
        x += dx
        y += dy
    }
}
```

Структуры копируются при присваивании. Чтобы менять свойства из метода, нужен `mutating`.

## Задание

Сделай `struct Counter`:

- свойство `value: Int`
- инициализатор `init(start: Int = 0)`
- метод `mutating func increment(by: Int = 1)`
- computed property `label` → `"counter: N"`

```bash
swift start.swift
```

## Подсказка

В `increment` просто `value += by`.

## Дальше по книге

[Structures and Classes](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/classesandstructures)
