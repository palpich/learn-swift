# Урок 06 — Массивы

## Цель

Создавать массивы, обходить их и считать простые агрегаты.

## Теория

```swift
var numbers = [3, 1, 4, 1, 5]
numbers.append(9)
numbers.count
numbers.contains(4)
numbers.first
```

Сумма через цикл:

```swift
var sum = 0
for x in numbers {
    sum += x
}
```

## Задание

1. `average(_:)` — среднее арифметическое как `Double`. Для пустого массива верни `0.0`.
2. `uniqueInOrder(_:)` — уникальные целые **в порядке первого появления**.

```bash
swift start.swift
```

## Подсказка

Для уникальных заведи `Set` «уже видел» и новый массив результата.

## Дальше по книге

[Collection Types — Arrays](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/collectiontypes#Arrays)
