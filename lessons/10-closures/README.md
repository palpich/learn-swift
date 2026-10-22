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

Ещё два частых метода:

```swift
let ages = ["Anya": 20, "Boris": 35]
let known = ["Anya", "Olga", "Boris"].compactMap { ages[$0] } // [20, 35] — как map, но выбрасывает nil
let total = known.reduce(0, +)                                 // 55 — сворачивает массив в одно значение
```

## Задание

1. `evenNumbers(_:)` — только чётные числа, порядок сохранить.
2. `doubleValues(_:)` — каждое число × 2.
3. `sortByLength(_:)` — строки по возрастанию длины; при равной длине — по алфавиту.

```bash
swift start.swift
```

## Повторение

Пригодится `Int(...)`, который возвращает опционал, из [урока 08](../08-optionals).

4. `sumOfNumbers(_:)` — сложи все строки, которые получилось превратить в число, остальные пропусти: `["1", "x", "3"]` → `4`.

## Подсказка

Для сортировки: сначала сравни `count`, при равенстве — сами строки `<`.

`sumOfNumbers` укладывается в одну строку: `compactMap` с `Int($0)`, затем `reduce(0, +)`.

## Дальше по книге

[Closures](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/closures)
