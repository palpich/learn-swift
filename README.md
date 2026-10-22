# Learn Swift — практический курс

Курс на русском: **16 lessons** по языку Swift и **4 console projects**. В каждом уроке — короткая теория, задание с `TODO` и автоматическая проверка через `swift`.

Xcode-проект не нужен: достаточно командной строки и установленного Swift.

## Установка и проверка

На macOS Swift ставится вместе с **Xcode** или **Command Line Tools**:

```bash
xcode-select --install   # если tools ещё не стоят
swift --version
```

Ожидается что-то вроде `Apple Swift version 5.x` или `6.x`.

## Как проходить lesson

1. Открой папку урока, например `lessons/01-first-program`.
2. Прочитай `README.md`.
3. Прави код в `start.swift` (ищи комментарии `TODO`).
4. Запусти проверку:

```bash
cd lessons/01-first-program
swift start.swift
```

Если всё верно, в конце будет сообщение об успехе и код выхода `0`. Если нет — файл напечатает, что не сошлось, и завершится с кодом `1`.

Застрял — открой `solution.swift` (тот же код с рабочим решением) и сравни.

## Маршрут обучения

| Step | Folder | Что тренируешь |
|------|--------|----------------|
| 1 | [`lessons/01-first-program`](lessons/01-first-program) | `print`, комментарии, запуск файла |
| 2 | [`lessons/02-constants-and-types`](lessons/02-constants-and-types) | `let` / `var`, типы, интерполяция |
| 3 | [`lessons/03-strings`](lessons/03-strings) | строки, регистр, палиндром |
| 4 | [`lessons/04-conditionals`](lessons/04-conditionals) | `if`, `switch`, диапазоны |
| 5 | [`lessons/05-loops`](lessons/05-loops) | `for`, `while`, FizzBuzz |
| ★ | [`projects/01-guess-the-number`](projects/01-guess-the-number) | игра «угадай число» |
| 6 | [`lessons/06-arrays`](lessons/06-arrays) | массивы, среднее, уникальные |
| 7 | [`lessons/07-dictionaries-and-sets`](lessons/07-dictionaries-and-sets) | словари и множества |
| 8 | [`lessons/08-optionals`](lessons/08-optionals) | `Optional`, `if let`, `guard`, `??` |
| ★ | [`projects/02-hangman`](projects/02-hangman) | виселица |
| 9 | [`lessons/09-functions`](lessons/09-functions) | функции, метки, `return` |
| 10 | [`lessons/10-closures`](lessons/10-closures) | замыкания, `map` / `filter` / `sorted` |
| 11 | [`lessons/11-enumerations`](lessons/11-enumerations) | `enum` |
| 12 | [`lessons/12-structures`](lessons/12-structures) | `struct`, методы, `mutating` |
| 13 | [`lessons/13-classes`](lessons/13-classes) | `class`, ссылки, наследование |
| 14 | [`lessons/14-protocols`](lessons/14-protocols) | протоколы и расширения |
| 15 | [`lessons/15-errors`](lessons/15-errors) | `throws`, `try`, `do/catch` |
| ★ | [`projects/03-calculator`](projects/03-calculator) | калькулятор с ошибками |
| 16 | [`lessons/16-generics`](lessons/16-generics) | дженерики и стек |
| ★ | [`projects/04-notes`](projects/04-notes) | заметки в файл |
| → | [`next-swiftui`](next-swiftui) | карта следующего этапа: SwiftUI |

### Projects

Интерактивно:

```bash
cd projects/01-guess-the-number
swift start.swift
```

Автопроверка без ручного ввода:

```bash
swift start.swift check
# или готовое решение:
swift solution.swift check
```

## Откуда взят план

Порядок тем и формат собраны из открытых программ (тексты и код уроков — свои):

- [The Swift Programming Language](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/) — официальный гид ([swiftlang/swift-book](https://github.com/swiftlang/swift-book))
- [tornikegomareli/swiftlings](https://github.com/tornikegomareli/swiftlings) — идея коротких упражнений с проверкой
- [alexpaul/Swift-Fundamentals](https://github.com/alexpaul/Swift-Fundamentals) — идеи консольных проектов
- Дальше по UI: [Develop in Swift](https://developer.apple.com/tutorials/develop-in-swift) и [100 Days of SwiftUI](https://www.hackingwithswift.com/100/swiftui)

Удачи. Пиши код руками — это и есть учёба.
