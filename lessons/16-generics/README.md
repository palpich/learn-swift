# Урок 16 — Дженерики

## Цель

Написать код, который работает с разными типами одинаково.

## Теория

```swift
func first<T>(_ array: [T]) -> T? {
    return array.first
}

struct Box<T> {
    var inside: T
}
```

`<T>` — заполнитель типа. Компилятор подставит `Int`, `String` и т.д.

## Задание

1. `func swapValues<T>(_ a: inout T, _ b: inout T)` — обменяй значения.
2. `struct Stack<Element>`:
   - приватный массив элементов
   - `mutating func push(_ element: Element)`
   - `mutating func pop() -> Element?` — снять верхний или `nil`, если пусто
   - `var count: Int`

```bash
swift start.swift
```

## Подсказка

Обмен: `let tmp = a; a = b; b = tmp`. Для стека — `append` / `popLast`.

## Дальше по книге

[Generics](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/generics)

## Дальше по курсу

Сделай проект [`projects/04-notes`](../../projects/04-notes), затем загляни в [`next-swiftui`](../../next-swiftui).
