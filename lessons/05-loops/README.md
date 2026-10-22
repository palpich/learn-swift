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

Цикл по строке перебирает её символы — каждый имеет тип `Character`:

```swift
for letter in "Swift" {
    print(letter)   // S, w, i, f, t
}
```

Результат удобно собирать в массив: `var result: [String] = []`, затем `result.append("Fizz")`. Подробно массивы — в уроке 06.

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

## Повторение

Пригодятся `lowercased()` и `contains` из [урока 03](../03-strings) и `if` из [урока 04](../04-conditionals).

`countVowels(_:)` — посчитай гласные `a e i o u` в строке без учёта регистра: `countVowels("AEIOU and you")` → `8`.

## Подсказка

Сначала проверяй `i % 15 == 0`, потом `% 3` и `% 5`. Если `n < 1`, сразу верни пустой массив: диапазон `1...n` с `n < 1` уронит программу.

Для гласных пройди циклом по `text.lowercased()` и проверяй `"aeiou".contains(letter)`.

## Дальше по книге

[Control Flow — Loops](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow#For-In-Loops)

## Дальше по курсу

После этого урока сделай проект [`projects/01-guess-the-number`](../../projects/01-guess-the-number).
