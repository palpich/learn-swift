# Урок 02 — Константы и типы

## Цель

Понять разницу между `let` и `var` и собрать описание значения из базовых типов.

## Теория

```swift
let year = 2026          // константа, менять нельзя
var counter = 0          // переменная
counter += 1

let pi: Double = 3.14
let name: String = "Swift"
let ready: Bool = true
```

Интерполяция вставляет значение в строку: `"\(year)"`.

## Задание

Реализуй `describe(name:age:heightMeters:isStudent:)`:

- верни строку вида `Name: Anya, age: 20, height: 1.7 m, student: yes`
- для `isStudent == true` пиши `yes`, иначе `no`
- рост печатай как есть (без лишнего округления в строке)

```bash
swift start.swift
```

## Подсказка

`let status = isStudent ? "yes" : "no"`, затем собери одну строку через интерполяцию.

## Дальше по книге

[The Basics](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics)
