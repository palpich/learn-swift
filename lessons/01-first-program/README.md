# Урок 01 — Первая программа

## Цель

Запустить файл Swift из терминала и вывести текст на экран.

## Теория

Файл `.swift` можно выполнить так:

```bash
swift start.swift
```

Функция `print` печатает значение и переводит строку:

```swift
print("Hello, Swift!")
```

Комментарии:

```swift
// одна строка
/* несколько
   строк */
```

## Задание

В `start.swift` реализуй функцию `greeting(name:)`, которая возвращает строку вида `Hello, Name!` (пробел после запятой, восклицательный знак в конце).

Запуск:

```bash
swift start.swift
```

## Подсказка

Собери строку через интерполяцию: `"Hello, \(name)!"`.

## Дальше по книге

[A Swift Tour](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/guidedtour)
