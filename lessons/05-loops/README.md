# Урок 05 — Циклы

## Цель

Повторять действия через `for` и `while`, собрать классический FizzBuzz.

## Теория

```swift
for i in 1...5 {
    print(i)
}

var n = 3
while n > 0 {
    n -= 1
}
```

`continue` пропускает итерацию, `break` выходит из цикла.

## Задание

Реализуй `fizzBuzz(upTo:)` — верни массив строк для чисел от `1` до `n` включительно:

- кратно 3 и 5 → `"FizzBuzz"`
- кратно 3 → `"Fizz"`
- кратно 5 → `"Buzz"`
- иначе → строка с самим числом (`"1"`, `"2"`, …)

Если `n < 1`, верни пустой массив.

```bash
swift start.swift
```

## Подсказка

Сначала проверяй `i % 15 == 0`, потом `% 3` и `% 5`.

## Дальше по книге

[Control Flow — Loops](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow#For-In-Loops)

## Дальше по курсу

После этого урока сделай проект [`projects/01-guess-the-number`](../../projects/01-guess-the-number).
