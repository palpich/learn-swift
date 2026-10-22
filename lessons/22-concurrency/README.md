# Урок 22 — Concurrency (async/await)

## Цель

Писать асинхронный код через `async`/`await` и `Task`, плюс простой `actor`.

## Теория

```swift
func load() async -> String { "ok" }
let value = await load()

Task {
    let v = await load()
    print(v)
}

actor Counter {
    var value = 0
    func bump() { value += 1 }
}
```

`await` можно вызывать только из async-контекста. В скрипте async-проверки запускаем через `Task` + `DispatchSemaphore`, чтобы `swift start.swift` дождался конца.

Ещё три понятия, которые встретятся в реальных проектах:

- `@MainActor` — код, который выполняется на главном потоке. Так помечают всё, что обновляет интерфейс; view в SwiftUI уже работают на нём.
- `Sendable` — тип, который безопасно передавать между задачами. Структуры из простых полей и акторы такие автоматически, а в режиме Swift 6 компилятор проверяет это сам.
- `withTaskGroup` — запуск заранее неизвестного числа задач параллельно:

```swift
let total = await withTaskGroup(of: Int.self) { group in
    for n in [1, 2, 3] {
        group.addTask { await slowSquare(n) }
    }
    var sum = 0
    for await value in group {
        sum += value
    }
    return sum
}
```

## Задание

1. `func delayedSum(_ a: Int, _ b: Int) async -> Int` — подожди 10 мс через `try? await Task.sleep(nanoseconds: 10_000_000)` и верни `a + b`. `Task.sleep` может бросить ошибку (если задачу отменили), а функция не помечена `throws`, поэтому нужен `try?`.
2. `func parallelLabels() async -> [String]` — через `async let` параллельно получи `"A"` и `"B"` из двух async-функций `labelA()` / `labelB()` (уже даны), верни `["A", "B"]`.
3. `actor Scoreboard` хранит очки игроков в словаре `scores`. Реализуй `add(_ points: Int, for player: String)` — прибавь очки игроку.

Проверки запускаются внутри `Task` / top-level async.

```bash
swift start.swift
```

## Повторение

Пригодятся словари из [урока 07](../07-dictionaries-and-sets), опционалы из [урока 08](../08-optionals) и `reduce` / `max` из [урока 10](../10-closures).

4. `total()` — сумма очков всех игроков.
5. `leader()` — имя игрока с наибольшим счётом или `nil`, если очков ещё нет.

## Подсказка

`scores.values.reduce(0, +)` и `scores.max { $0.value < $1.value }?.key`.

## Дальше по книге

[Concurrency](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/concurrency)
