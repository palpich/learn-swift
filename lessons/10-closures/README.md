# Урок 10 — Замыкания

## Цель

Передавать функции как значения и пользоваться `sorted`, `filter`, `map`.

## Теория

```swift
let numbers = [3, 1, 4]
let descending = numbers.sorted { $0 > $1 }
let evens = numbers.filter { $0 % 2 == 0 }
let squares = numbers.map { $0 * $0 }
```

Замыкание — блок кода `{ параметры in тело }`. Короткий синтаксис `$0`, `$1` — аргументы по порядку.

## Задание

1. `evenNumbers(_:)` — только чётные числа, порядок сохранить.
2. `doubleValues(_:)` — каждое число × 2.
3. `sortByLength(_:)` — строки по возрастанию длины; при равной длине — по алфавиту.

```bash
swift start.swift
```

## Подсказка

Для сортировки: сначала сравни `count`, при равенстве — сами строки `<`.

## Дальше по книге

[Closures](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/closures)
