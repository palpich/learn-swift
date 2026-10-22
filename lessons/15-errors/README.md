# Урок 15 — Ошибки

## Цель

Сообщать о сбоях через `throws`, `try` и `do/catch`.

## Теория

```swift
enum DivisionError: Error {
    case divideByZero
}

func divide(_ a: Int, by b: Int) throws -> Int {
    guard b != 0 else { throw DivisionError.divideByZero }
    return a / b
}

do {
    let r = try divide(10, by: 2)
    print(r)
} catch {
    print("failed: \(error)")
}
```

`try?` превращает ошибку в `nil`. `try!` падает при ошибке — в учёбе почти не используй.

## Задание

1. Enum `PasswordError: Error` с кейсами `tooShort`, `noDigit`.
2. `validatePassword(_:)` — `throws`:
   - длина < 8 → `tooShort`
   - нет ни одной цифры `0...9` → `noDigit`
   - иначе ничего не бросай (функция `Void`)
3. `safeValidate(_:)` — верни `"ok"` при успехе, `"too short"` или `"no digit"` при соответствующих ошибках. Другие ошибки → `"unknown"`.

```bash
swift start.swift
```

## Повторение

Пригодятся диапазоны из [урока 04](../04-conditionals), `guard let` из [урока 08](../08-optionals) и связанные значения enum из [урока 11](../11-enumerations).

4. `enum AgeError: Error` с кейсами `notANumber(String)` и `outOfRange(Int)`.
5. `parseAge(_:) throws -> Int`:
   - строка не число → брось `notANumber` с исходной строкой;
   - число вне `0...150` → брось `outOfRange` с этим числом;
   - иначе верни возраст.

## Подсказка

Цифру можно искать так: `password.contains { $0.isNumber }`.

В `parseAge` два `guard` подряд: `guard let age = Int(text) else { throw ... }`, затем `guard (0...150).contains(age) else { throw ... }`.

## Дальше по книге

[Error Handling](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/errorhandling)

## Дальше по курсу

После этого урока сделай проект [`projects/03-calculator`](../../projects/03-calculator).
