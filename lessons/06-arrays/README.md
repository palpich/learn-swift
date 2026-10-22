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
numbers.isEmpty
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

## Повторение

Пригодятся `count` у строки из [урока 03](../03-strings), `if` из [урока 04](../04-conditionals) и `for` из [урока 05](../05-loops).

3. `longWords(_:minLength:)` — верни слова, в которых не меньше `minLength` букв, в исходном порядке.

## Подсказка

Для уникальных заведи пустой массив результата и добавляй число, только если `!result.contains(x)`. В уроке 07 увидишь, как то же сделать быстрее через `Set`.

Для среднего: если массив пустой, сразу верни `0.0`, иначе раздели сумму на `count`, приведя обе части к `Double`.

## Дальше по книге

[Collection Types — Arrays](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/collectiontypes#Arrays)
