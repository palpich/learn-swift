# Learn Swift — практический курс

Курс на русском: **29 lessons** по Swift и **5 console/Xcode projects**. В обычных уроках — теория, `TODO` и проверка через `swift`. Часть тем (SwiftUI, SwiftData, SPM, тесты) запускается через Xcode или `swift test` / `swift run`.

## Установка

```bash
xcode-select --install   # если ещё не стоят tools
swift --version
```

Для уроков 26–27 нужен **Xcode** из App Store.

## Как проходить обычный lesson

```bash
cd lessons/01-first-program
swift start.swift
```

Застрял — смотри `solution.swift`.

Особые запуски:

| Lessons | Команда |
|---------|---------|
| 22, 24, projects/05 | `swift start.swift` / `swift start.swift check` |
| 26–27 | Xcode App, файлы `*.start.swift` |
| 28 | `cd lessons/28-testing && swift test` |
| 29 | `cd lessons/29-spm-modules && swift run App` |

## Маршрут

### База языка (1–16)

| Step | Folder | Тема |
|------|--------|------|
| 1 | [`lessons/01-first-program`](lessons/01-first-program) | `print`, запуск файла |
| 2 | [`lessons/02-constants-and-types`](lessons/02-constants-and-types) | `let` / `var`, типы |
| 3 | [`lessons/03-strings`](lessons/03-strings) | строки |
| 4 | [`lessons/04-conditionals`](lessons/04-conditionals) | `if` / `switch` |
| 5 | [`lessons/05-loops`](lessons/05-loops) | циклы, FizzBuzz |
| ★ | [`projects/01-guess-the-number`](projects/01-guess-the-number) | угадай число |
| 6 | [`lessons/06-arrays`](lessons/06-arrays) | массивы |
| 7 | [`lessons/07-dictionaries-and-sets`](lessons/07-dictionaries-and-sets) | словари, множества |
| 8 | [`lessons/08-optionals`](lessons/08-optionals) | опционалы |
| ★ | [`projects/02-hangman`](projects/02-hangman) | виселица |
| 9 | [`lessons/09-functions`](lessons/09-functions) | функции |
| 10 | [`lessons/10-closures`](lessons/10-closures) | замыкания |
| 11 | [`lessons/11-enumerations`](lessons/11-enumerations) | `enum` |
| 12 | [`lessons/12-structures`](lessons/12-structures) | `struct` |
| 13 | [`lessons/13-classes`](lessons/13-classes) | `class` |
| 14 | [`lessons/14-protocols`](lessons/14-protocols) | протоколы |
| 15 | [`lessons/15-errors`](lessons/15-errors) | ошибки |
| ★ | [`projects/03-calculator`](projects/03-calculator) | калькулятор |
| 16 | [`lessons/16-generics`](lessons/16-generics) | дженерики |
| ★ | [`projects/04-notes`](projects/04-notes) | заметки в файл |

### Повседневный Swift (17–25)

| Step | Folder | Тема |
|------|--------|------|
| 17 | [`lessons/17-extensions`](lessons/17-extensions) | extensions |
| 18 | [`lessons/18-equatable-hashable-comparable`](lessons/18-equatable-hashable-comparable) | Equatable / Hashable / Comparable |
| 19 | [`lessons/19-result-defer-access-control`](lessons/19-result-defer-access-control) | Result, defer, access control |
| 20 | [`lessons/20-arc-and-memory`](lessons/20-arc-and-memory) | ARC, `weak` |
| 21 | [`lessons/21-codable`](lessons/21-codable) | Codable / JSON |
| 22 | [`lessons/22-concurrency`](lessons/22-concurrency) | async/await, Task, actor |
| 23 | [`lessons/23-dates-and-formatting`](lessons/23-dates-and-formatting) | Date, ISO8601 |
| 24 | [`lessons/24-networking`](lessons/24-networking) | URLSession |
| 25 | [`lessons/25-userdefaults`](lessons/25-userdefaults) | UserDefaults |
| ★ | [`projects/05-json-client`](projects/05-json-client) | JSON-клиент |

### UI, тесты, пакеты (26–29)

| Step | Folder | Тема |
|------|--------|------|
| 26 | [`lessons/26-swiftui-basics`](lessons/26-swiftui-basics) | SwiftUI (Xcode) |
| 27 | [`lessons/27-swiftdata`](lessons/27-swiftdata) | SwiftData (Xcode) |
| 28 | [`lessons/28-testing`](lessons/28-testing) | Swift Testing |
| 29 | [`lessons/29-spm-modules`](lessons/29-spm-modules) | SPM / modules |
| → | [`next-swiftui`](next-swiftui) | куда углубляться дальше |

## Projects — автопроверка

```bash
swift start.swift check
swift solution.swift check
```

## Источники плана

- [The Swift Programming Language](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/)
- [swiftlings](https://github.com/tornikegomareli/swiftlings)
- [Swift-Fundamentals](https://github.com/alexpaul/Swift-Fundamentals)
- [Develop in Swift](https://developer.apple.com/tutorials/develop-in-swift) · [100 Days of SwiftUI](https://www.hackingwithswift.com/100/swiftui)

Удачи. Пиши код руками — это и есть учёба.
