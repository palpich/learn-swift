# Урок 04 — Условия

## Цель

Выбирать ветку кода через `if` / `else` и `switch`.

## Теория

```swift
if score >= 90 {
    print("excellent")
} else if score >= 75 {
    print("good")
} else {
    print("needs work")
}

switch score {
case 90...100: print("A")
case 75..<90: print("B")
default: print("C")
}
```

Тернарный оператор: `let sign = x >= 0 ? "+" : "-"`.

## Задание

Реализуй `grade(score:)` для целого `0...100`:

| Score | Result |
|-------|--------|
| 90...100 | `"excellent"` |
| 75...89 | `"good"` |
| 50...74 | `"satisfactory"` |
| 0...49 | `"fail"` |
| иначе | `"invalid score"` |

```bash
swift start.swift
```

## Повторение

Пригодятся тернарный оператор из [урока 02](../02-constants-and-types) и `isEmpty` / `uppercased()` из [урока 03](../03-strings).

`report(name:score:)` — верни имя в верхнем регистре и оценку через двоеточие: `report(name: "Anya", score: 80)` → `"ANYA: good"`. Если имя пустое, вместо него пиши `UNKNOWN`.

## Подсказка

Удобно использовать `switch` с диапазонами `case 90...100:`.

В `report` вызови свою `grade(score:)`, а имя выбери тернарным оператором.

## Дальше по книге

[Control Flow](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow)
