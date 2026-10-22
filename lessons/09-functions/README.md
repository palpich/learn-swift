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

## Задание

1. `rectangleArea(width:height:)` — площадь (`Double`).
2. `repeatString(_ text:times:separator:)` — склей `text` `times` раз через `separator` (по умолчанию `"-"`).  
   Пример: `repeatString("ha", times: 3)` → `"ha-ha-ha"`. При `times <= 0` верни `""`.

```bash
swift start.swift
```

## Подсказка

Для повтора удобен массив `Array(repeating:count:).joined(separator:)`.

## Дальше по книге

[Functions](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/functions)
