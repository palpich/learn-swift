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

## Дальше по книге

[Result](https://developer.apple.com/documentation/swift/result) · [defer](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/errorhandling#Specifying-Cleanup-Actions) · [Access Control](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/accesscontrol)
