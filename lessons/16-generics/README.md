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

`inout` разбирали в [уроке 09](../09-functions).

```bash
swift start.swift
```

## Повторение

Пригодятся опционалы из [урока 08](../08-optionals) и замыкания из [урока 10](../10-closures).

3. У `Stack` свойство `var peek: Element?` — верхний элемент без удаления или `nil`, если стек пуст.
4. `countMatching(_:where:)` — сколько элементов подходят под условие: `countMatching([1, 5, 8, 2], where: { $0 > 4 })` → `2`. Функция дженерик — работает и с числами, и со строками.

## Подсказка

Обмен: `let tmp = a; a = b; b = tmp`. Для стека — `append` / `popLast`, для `peek` — `last`.

`countMatching`: `filter(predicate).count`.

## Дальше по книге

[Generics](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/generics)

## Дальше по курсу

Сделай проект [`projects/04-notes`](../../projects/04-notes), затем загляни в [`next-swiftui`](../../next-swiftui).
