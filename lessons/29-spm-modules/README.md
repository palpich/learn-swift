# Урок 29 — SPM и модули

## Цель

Собрать Swift Package с библиотекой и executable: `import` между модулями.

## Структура

```
29-spm-modules/
  Package.swift
  Sources/Greeter/Greeter.swift   # library
  Sources/Toolkit/Stack.swift     # library
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

## Повторение

Пригодятся `Stack` из [урока 16](../16-generics) и access control из [урока 19](../19-result-defer-access-control).

В модуле `Toolkit` уже лежит `Stack` из урока 16, но им нельзя воспользоваться из `App`: всё внутри модуля по умолчанию `internal` — видно только самому модулю.

4. Сделай `Stack` публичным: `public struct`, а также `public` у `count`, `peek`, `push` и `pop`. Добавь `public init() {}` — инициализатор, который Swift создаёт сам, остаётся `internal`.
5. В `Package.swift` добавь `"Toolkit"` в `dependencies` у target `App`.
6. В `main.swift` раскомментируй `import Toolkit` и код со стеком.

```bash
swift run App
# Hello, Swift!
# Last: second, left: 1
```

Сверяйся с `solution/` при необходимости (там лежат и `Stack.swift`, и `Package.swift`).

## Зачем это нужно

Почти любой серьёзный Swift-проект — набор модулей (SPM или Xcode targets). `import Foundation`, `import Greeter` — одна и та же идея.

## Дальше

[Swift Package Manager](https://documentation.swift.org/spm/documentation/packagemanagerdocs/)

## Дальше по курсу

Сделай финальный проект [`projects/06-final-app`](../../projects/06-final-app) — в нём сходится всё, что было в курсе.
