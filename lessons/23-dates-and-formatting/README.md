# Урок 23 — Даты и форматирование

## Цель

Работать с `Date`, `Calendar` и `ISO8601DateFormatter` / `DateFormatter`.

## Теория

```swift
let now = Date()
var cal = Calendar(identifier: .gregorian)
cal.timeZone = TimeZone(secondsFromGMT: 0)!

let iso = ISO8601DateFormatter()
iso.formatOptions = [.withInternetDateTime]
```

Для стабильных тестов всегда фиксируй `timeZone` и `locale`.

## Задание

1. `func makeDate(year:month:day:) -> Date` — дата в UTC через `Calendar`.
2. `func isoString(from date: Date) -> String` — ISO8601 internet date time в UTC.
3. `func daysBetween(_ a: Date, _ b: Date) -> Int` — целые дни от a к b через `Calendar.dateComponents` (UTC gregorian). Может быть отрицательным.

```bash
swift start.swift
```

## Повторение

Пригодятся `filter` / `sorted` / `map` из [урока 10](../10-closures), структуры из [урока 12](../12-structures) и `Comparable` из [урока 18](../18-equatable-hashable-comparable).

4. `struct Event: Comparable` с `name` и `date` — допиши `<`, чтобы события сравнивались по дате. Даты (`Date`) сами умеют сравниваться через `<`.
5. `upcoming(_:after:)` — имена событий, которые позже указанной даты, от ближайшего к дальнему.

## Подсказка

Раз `Event` — `Comparable`, массив событий сортируется просто `sorted()`.

## Дальше по докам

[Date](https://developer.apple.com/documentation/foundation/date) · [ISO8601DateFormatter](https://developer.apple.com/documentation/foundation/iso8601dateformatter)
