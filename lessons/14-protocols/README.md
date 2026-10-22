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

Тип, который соответствует протоколу, можно передавать как значение протокольного типа. Такой тип пишут с `any`: `func show(_ item: any Greetable)`, массив — `[any Greetable]`. Так видно, что внутри может лежать любой подходящий тип.

## Задание

1. Протокол `Describable` с computed property `summary: String`.
2. `struct Book: Describable` с полями `title`, `author` — `summary` → `"«Title» — Author"`.
3. Расширение протокола с методом `uppercasedSummary()` → `summary.uppercased()`.
4. `func printSummary(_ item: any Describable) -> String` — верни `item.summary`.

```bash
swift start.swift
```

## Повторение

Пригодятся `joined(separator:)` из [урока 09](../09-functions), `map` из [урока 10](../10-closures) и структуры из [урока 12](../12-structures).

5. `struct Movie: Describable` с `title` и `year` — `summary` → `"Alien (1979)"`.
6. `catalog(_:)` — склей описания через `"; "`: `catalog([movie, book])` → `"Alien (1979); «1984» — Orwell"`.

## Подсказка

Кавычки-ёлочки: `"«\(title)» — \(author)"`.

В `catalog` сначала `map { $0.summary }`, потом `joined(separator: "; ")`.

## Дальше по книге

[Protocols](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/protocols) · [Extensions](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/extensions)
