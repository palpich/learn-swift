# Урок 08 — Опционалы

## Цель

Безопасно работать со значениями, которых может не быть: `Optional`.

## Теория

```swift
let number = Int("42")      // Int?
let junk = Int("hello")     // nil

if let n = number {
    print(n)
}

let value = Int("x") ?? 0

func example(_ s: String) -> Int? {
    guard let n = Int(s) else { return nil }
    return n * 2
}
```

## Задание

1. `parseInt(_:)` — разбери строку в `Int?` (`nil`, если не число).
2. `multiplyOrZero(_:by:)` — умножь опциональное число на множитель; если числа нет, верни `0`.
3. `positiveOrNil(_:)` — если число > 0, верни его, иначе `nil`. Используй `guard`.

```bash
swift start.swift
```

## Подсказка

`Int(string)` уже даёт `Int?`. Для умножения удобен `?? 0`.

## Дальше по книге

[Optionals](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics#Optionals) · [Optional Chaining](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/optionalchaining)

## Дальше по курсу

После этого урока сделай проект [`projects/02-hangman`](../../projects/02-hangman).
