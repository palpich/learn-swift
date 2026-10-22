# Урок 03 — Строки

## Цель

Работать со строками: регистр, разворот, проверка палиндрома.

## Теория

```swift
let s = "Radar"
s.lowercased()           // "radar"
s.count                  // 5
String(s.reversed())     // "radaR"
s.contains("da")         // true
```

Палиндром читается одинаково слева направо и справа налево, если игнорировать регистр.

## Задание

1. `toLower(_:)` — верни строку в нижнем регистре.
2. `isPalindrome(_:)` — `true`, если строка (без учёта регистра) — палиндром.

Пустая строка считается палиндромом.

```bash
swift start.swift
```

## Подсказка

Сравни `lowercased()` с `String(text.lowercased().reversed())`.

## Дальше по книге

[Strings and Characters](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/stringsandcharacters)
