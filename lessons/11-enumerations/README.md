# Урок 11 — Перечисления

## Цель

Моделировать фиксированный набор вариантов через `enum`.

## Теория

```swift
enum Direction: String {
    case north = "N"
    case south = "S"
}

enum Result {
    case success(Int)
    case failure(String)
}
```

Сырые значения (`rawValue`) и связанные значения (`associated values`) решают разные задачи.

## Задание

Дан enum `Command` с кейсами `forward`, `back`, `left`, `right`.

1. Добавь сырой тип `String` и сырые значения `"F"`, `"B"`, `"L"`, `"R"`.
2. `code(_ command:)` — верни `rawValue`.
3. `fromCode(_:)` — создай `Command?` из строки (`nil`, если неизвестно).
4. `describe(_ result:)` для enum `DownloadResult` с кейсами `ok(bytes: Int)` и `fail(reason: String)`:
   - ok → `"downloaded: N bytes"`
   - fail → `"error: ..."`

```bash
swift start.swift
```

## Повторение

Пригодятся символы строки из [урока 05](../05-loops), опционалы из [урока 08](../08-optionals) и `compactMap` из [урока 10](../10-closures).

5. `parseCommands(_:)` — преврати строку в массив команд, неизвестные буквы пропусти: `"FFLX"` → `[.forward, .forward, .left]`.

### По желанию: вернись к старому проекту

В [`projects/02-hangman`](../../projects/02-hangman) статус хода — строка (`"ok"`, `"win"`, `"lose"`…). Опечатку в такой строке компилятор не заметит. Замени её на `enum GuessStatus { case ok, repeated, miss, win, lose }` и поправь `switch` в `runGame` — теперь компилятор проверит, что ты обработал все варианты.

## Подсказка

`Command(rawValue: code)` и `switch` по `DownloadResult`.

Цикл по строке отдаёт `Character`, а `rawValue` у `Command` — `String`, поэтому символ придётся обернуть: `String($0)`.

## Дальше по книге

[Enumerations](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/enumerations)
