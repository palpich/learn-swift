# Урок 09 — Функции

## Цель

Объявлять функции с метками аргументов, значениями по умолчанию и возвратом результата.

## Теория

```swift
func hello(name: String, excitedly: Bool = true) -> String {
    return excitedly ? "Hello, \(name)!" : "Hello, \(name)"
}

hello(name: "Anya")
hello(name: "Anya", excitedly: false)
```

Внешняя метка может отличаться от внутренней: `func step(_ value: Int, by stride: Int)`.

Параметры функции — константы. Если функция должна изменить переданную переменную, пометь параметр `inout`, а при вызове поставь `&`:

```swift
func double(_ value: inout Int) {
    value *= 2
}

var n = 5
double(&n)   // n == 10
```

## Задание

1. `rectangleArea(width:height:)` — площадь (`Double`).
2. `repeatString(_ text:times:separator:)` — склей `text` `times` раз через `separator` (по умолчанию `"-"`).  
   Пример: `repeatString("ha", times: 3)` → `"ha-ha-ha"`. При `times <= 0` верни `""`.

```bash
swift start.swift
```

## Повторение

Пригодится `??` из [урока 08](../08-optionals).

3. `greet(_:greeting:)` — имя опционально, приветствие по умолчанию `"Hello"`: `greet("Anya")` → `"Hello, Anya!"`, `greet(nil)` → `"Hello, guest!"`, `greet("Boris", greeting: "Hi")` → `"Hi, Boris!"`.

## Подсказка

Для повтора удобен массив `Array(repeating:count:).joined(separator:)`.

В `greet` хватит одной строки с интерполяцией: внутри `\( )` можно написать `name ?? "guest"`.

## Дальше по книге

[Functions](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/functions)
