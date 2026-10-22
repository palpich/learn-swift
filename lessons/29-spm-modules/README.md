# Урок 29 — SPM и модули

## Цель

Собрать Swift Package с библиотекой и executable: `import` между модулями.

## Структура

```
29-spm-modules/
  Package.swift
  Sources/Greeter/Greeter.swift   # library
  Sources/App/main.swift          # executable
```

## Запуск

```bash
cd lessons/29-spm-modules
swift run App
```

## Задание

1. В `Greeter.swift` сделай `public struct Greeter` с `public init(name: String)` и `public func greet() -> String` → `"Hello, \(name)!"`.
2. В `main.swift` создай `Greeter(name: "Swift")` и напечатай `greet()`.
3. `Package.swift` уже связывает target `App` → зависимость `Greeter`.

Проверка:

```bash
swift run App
# Hello, Swift!
```

Сверяйся с `solution/` при необходимости.

## Зачем это нужно

Почти любой серьёзный Swift-проект — набор модулей (SPM или Xcode targets). `import Foundation`, `import Greeter` — одна и та же идея.

## Дальше

[Swift Package Manager](https://documentation.swift.org/spm/documentation/packagemanagerdocs/)
