# Урок 17 — Extensions

## Цель

Расширять существующие типы новым поведением без наследования.

## Теория

```swift
extension Int {
    var isEven: Bool { self % 2 == 0 }
}

extension String {
    func trimmed() -> String {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
```

Extensions используют постоянно: удобные свойства, соответствие протоколам, разбиение большого типа на файлы.

## Задание

1. `extension Int` — свойство `isEven: Bool`.
2. `extension String` — метод `trimmed()` (обрезать пробелы/переводы строк по краям). Нужен `import Foundation`.
3. `extension Array where Element == Int` — метод `sum()` → сумма элементов.

```bash
swift start.swift
```

## Повторение

Пригодится проверка палиндрома из [урока 03](../03-strings).

4. В том же `extension String` добавь свойство `isPalindrome: Bool`. Теперь можно писать `"Radar".isPalindrome` вместо `isPalindrome("Radar")`.

## Подсказка

`trimmingCharacters(in: .whitespacesAndNewlines)`. Для суммы — `reduce(0, +)` из [урока 10](../10-closures).

Внутри extension строка — это `self`, поэтому можно писать просто `lowercased()`.

## Дальше по книге

[Extensions](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/extensions)
