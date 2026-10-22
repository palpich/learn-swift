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

## Задание

1. `func delayedSum(_ a: Int, _ b: Int) async -> Int` — `try await Task.sleep(nanoseconds: 10_000_000)`, верни `a + b`.
2. `func parallelLabels() async -> [String]` — через `async let` параллельно получи `"A"` и `"B"` из двух async-функций `labelA()` / `labelB()` (уже даны), верни `["A", "B"]`.
3. `actor Scoreboard` с `add(_ points: Int)` и `current() -> Int`.

Проверки запускаются внутри `Task` / top-level async.

```bash
swift start.swift
```

## Дальше по книге

[Concurrency](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/concurrency)
