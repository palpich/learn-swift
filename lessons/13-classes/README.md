# Урок 13 — Классы

## Цель

Увидеть разницу между ссылочным типом (`class`) и значением (`struct`), плюс простое наследование.

## Теория

```swift
class Animal {
    var name: String
    init(name: String) { self.name = name }
    func sound() -> String { "..." }
}

class Dog: Animal {
    override func sound() -> String { "woof" }
}
```

Если два имени указывают на один экземпляр класса, изменение через одно видно через другое.

## Задание

1. Класс `CounterClass` со свойством `value` и методом `increment()`.
2. Функция `shareReference()` — создай счётчик со значением `0`, передай его во вторую переменную, увеличь через вторую, верни значение первой. Должно получиться `1` (общая ссылка).
3. Класс `Transport` с методом `kind() -> String` → `"transport"`.
4. Класс `Bus: Transport`, переопредели `kind()` → `"bus"`.

```bash
swift start.swift
```

## Подсказка

В `shareReference` не копируй значение вручную — просто `let b = a` для класса.

## Дальше по книге

[Classes](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/classesandstructures) · [Inheritance](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/inheritance)
