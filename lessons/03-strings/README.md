# Урок 03 — Строки

## Цель

Работать со строками: регистр, разворот, проверка палиндрома.

## Теория

```swift
let s = "Radar"
s.lowercased()           // "radar"
s.uppercased()           // "RADAR"
s.count                  // 5
s.isEmpty                // false
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

## Повторение

Пригодятся тернарный оператор и интерполяция из [урока 02](../02-constants-and-types).

3. `describeWord(_:)` — верни строку вида `radar: 5 letters, palindrome: yes`: слово в нижнем регистре, число букв и `yes`/`no` для палиндрома.

## Подсказка

Сравни `lowercased()` с `String(text.lowercased().reversed())`.

В `describeWord` можно вызвать свою же `isPalindrome`: `isPalindrome(word) ? "yes" : "no"`.

## Дальше по книге

[Strings and Characters](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/stringsandcharacters)
