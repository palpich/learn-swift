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

Проверки также убеждаются, что копия счётчика меняется независимо от оригинала — это и есть «тип-значение».

## Повторение

Пригодятся `switch` из [урока 04](../04-conditionals) и `enum` с `rawValue` из [урока 11](../11-enumerations). Enum `Command` уже есть в файле.

`struct Robot` стоит в точке `(0, 0)`. Допиши `mutating func run(_ commands: String)`: для каждой буквы найди команду и сдвинь робота — `F` → `y + 1`, `B` → `y - 1`, `L` → `x - 1`, `R` → `x + 1`. Неизвестные буквы пропускай. После `run("FFRX")` робот стоит в `(1, 2)`.

## Подсказка

В `increment` просто `value += by`.

В `run`: цикл по строке, `guard let command = Command(rawValue: String(letter)) else { continue }`, затем `switch command`.

## Дальше по книге

[Structures and Classes](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/classesandstructures)
