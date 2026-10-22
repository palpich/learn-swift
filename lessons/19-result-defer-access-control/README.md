# Урок 19 — Result, defer, access control

## Цель

Вернуть успех/ошибку без `throws`, гарантировать cleanup через `defer`, ограничить видимость через `private`.

## Теория

```swift
let r: Result<Int, DivisionError> = .success(1)
try r.get()

defer { print("always last in scope") }

struct Vault {
    private var secret = "x"
    func read() -> String { secret }
}
```

## Задание

1. `enum DivisionError: Error { case divideByZero }`.
2. `func divide(_ a: Int, by b: Int) -> Result<Int, DivisionError>`.
3. Класс `Log` с `var lines: [String]`.
4. `func withCleanup(log: Log, work: () -> Int) -> Int` — добавь `"start"`, через `defer` добавь `"end"`, верни результат `work()`.
5. `struct CounterBox` — `private(set) var value`, метод `bump()`.

```bash
swift start.swift
```

## Повторение

Пригодятся кортежи из [урока 07](../07-dictionaries-and-sets), `map` из [урока 10](../10-closures) и `switch` по связанным значениям из [урока 11](../11-enumerations).

6. `describeDivisions(_:)` — для каждой пары `(a, b)` вызови `divide` и верни текст: результат числом или `"divide by zero"`. Пример: `[(10, 2), (1, 0)]` → `["5", "divide by zero"]`.

## Подсказка

`Result` — это enum с кейсами `.success(value)` и `.failure(error)`, поэтому разбирается тем же `switch`, что и `DownloadResult` в уроке 11. К частям кортежа можно обращаться как `pair.0` и `pair.1`.

## Дальше по книге

[Result](https://developer.apple.com/documentation/swift/result) · [defer](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/errorhandling#Specifying-Cleanup-Actions) · [Access Control](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/accesscontrol)
