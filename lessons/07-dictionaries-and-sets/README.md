# Урок 07 — Словари и множества

## Цель

Считать частоты через словарь и пересекать множества.

## Теория

```swift
var frequencies: [String: Int] = [:]
frequencies["apple", default: 0] += 1

let a: Set = [1, 2, 3]
let b: Set = [2, 3, 4]
let shared = a.intersection(b) // {2, 3}
```

## Задание

1. `wordFrequencies(_:)` — для массива строк верни словарь «слово → сколько раз встретилось».
2. `commonElements(_:_:)` — верни отсортированный по возрастанию массив общих целых из двух массивов (как пересечение множеств).

```bash
swift start.swift
```

## Подсказка

`default: 0` у словаря удобен для счётчика. Для пересечения: `Set(a).intersection(Set(b)).sorted()`.

## Дальше по книге

[Dictionaries](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/collectiontypes#Dictionaries) · [Sets](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/collectiontypes#Sets)
