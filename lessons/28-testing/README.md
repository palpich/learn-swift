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

## Повторение

В `Sources/CourseLib/Review.swift` лежит уже готовый код из прошлых уроков: `isPalindrome` ([урок 03](../03-strings)), `grade(score:)` ([урок 04](../04-conditionals)) и `parseAge` ([урок 15](../15-errors)). Код менять не нужно — твоя задача его протестировать. Это и есть повторение: чтобы написать тест, придётся вспомнить, как код должен себя вести.

3. В `Tests/CourseTests/ReviewTests.swift` закрой TODO:
   - `palindromes` — добавь проверки для `"Swift"` и пустой строки;
   - `grades` — параметризованный тест: один тест прогоняется на каждой паре из `arguments`. Замени `"TODO"` на правильные оценки по таблице из урока 04;
   - `ageErrors` — проверь, что `parseAge("200")` бросает `AgeError.outOfRange(200)`.

Проверка на ошибку выглядит так:

```swift
#expect(throws: AgeError.notANumber("abc")) {
    try parseAge("abc")
}
```

Сверяйся с `solution/` файлами при необходимости (скопируй поверх start-версий).

## Дальше

[Swift Testing](https://developer.apple.com/documentation/testing) · [XCTest](https://developer.apple.com/documentation/xctest) (старший фреймворк, тоже часто встречается)
