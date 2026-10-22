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

Цикл по словарю отдаёт пары «ключ — значение»:

```swift
for (word, count) in frequencies {
    print("\(word): \(count)")
}
```

`(word, count)` — это кортеж: несколько значений в одних скобках. Функция тоже может вернуть кортеж, а части можно назвать:

```swift
func minMax() -> (min: Int, max: Int) {
    return (1, 9)
}
let range = minMax()
range.min   // 1
```

## Задание

1. `wordFrequencies(_:)` — для массива строк верни словарь «слово → сколько раз встретилось».
2. `commonElements(_:_:)` — верни отсортированный по возрастанию массив общих целых из двух массивов (как пересечение множеств).

```bash
swift start.swift
```

## Повторение

Пригодятся `switch` с диапазонами из [урока 04](../04-conditionals) и обход массива из [урока 06](../06-arrays).

3. `gradeHistogram(_:)` — посчитай, сколько оценок попало в каждую группу: `80...100` → `"high"`, `50...79` → `"mid"`, `0...49` → `"low"`. Оценки вне `0...100` пропускай. Пример: `[95, 60, 70, 10]` → `["high": 1, "mid": 2, "low": 1]`.

## Подсказка

`default: 0` у словаря удобен для счётчика. Для пересечения: `Set(a).intersection(Set(b)).sorted()`.

В `gradeHistogram` внутри цикла поставь `switch score`, а в ветке `default:` напиши `break`.

## Дальше по книге

[Dictionaries](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/collectiontypes#Dictionaries) · [Sets](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/collectiontypes#Sets)
