# Урок 28 — Testing (Swift Testing)

## Цель

Писать автоматические тесты — так проверяют код в реальных проектах.

## Как запускать

```bash
cd lessons/28-testing
swift test
```

Используем встроенный фреймворк **Swift Testing** (`import Testing`).

## Теория

```swift
import Testing

@Test func addition() {
    #expect(2 + 2 == 4)
}
```

Тесты живут в target `CourseTests`. Логика для проверки — в `Sources/CourseLib`.

## Задание

1. В `Sources/CourseLib/Math.swift` реализуй:
   - `public func clamp(_ value: Int, min: Int, max: Int) -> Int`
   - `public func average(_ values: [Double]) -> Double?` (nil если пусто)
2. В `Tests/CourseTests/MathTests.swift` допиши тесты (см. TODO), чтобы `swift test` проходил.

Сверяйся с `solution/` файлами при необходимости (скопируй поверх start-версий).

## Дальше

[Swift Testing](https://developer.apple.com/documentation/testing) · [XCTest](https://developer.apple.com/documentation/xctest) (старший фреймворк, тоже часто встречается)
