# Урок 14 — Протоколы

## Цель

Описать контракт через `protocol` и дать реализацию по умолчанию в `extension`.

## Теория

```swift
protocol Greetable {
    var name: String { get }
    func greet() -> String
}

extension Greetable {
    func greet() -> String {
        return "Hello, \(name)!"
    }
}
```

Тип, который соответствует протоколу, можно передавать как значение протокольного типа.

## Задание

1. Протокол `Describable` с computed property `summary: String`.
2. `struct Book: Describable` с полями `title`, `author` — `summary` → `"«Title» — Author"`.
3. Расширение протокола с методом `uppercasedSummary()` → `summary.uppercased()`.
4. `func printSummary(_ item: Describable) -> String` — верни `item.summary`.

```bash
swift start.swift
```

## Подсказка

Кавычки-ёлочки: `"«\(title)» — \(author)"`.

## Дальше по книге

[Protocols](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/protocols) · [Extensions](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/extensions)
