# Project 03 — Calculator

После уроков 09–15.

## Цель

Простые выражения `a + b`, деление на ноль как ошибка, цикл команд в терминале.

## Задание

1. `enum CalcError: Error` — кейсы `unknownOperation`, `divideByZero`, `invalidInput`.
2. `enum Operation: String` — допиши кейсы `subtract`, `multiply`, `divide` с сырыми значениями `"-"`, `"*"`, `"/"` (как `Command` в [уроке 11](../../lessons/11-enumerations)).
3. `calculate(a:op:b:)` — `throws -> Double`, `switch` по `Operation`:
   - `+ - * /` как обычно;
   - деление при `b == 0` → `divideByZero`.
4. `parse(_ string:)` — разбери `"12.5 * 2"` (три части через пробел) в `(Double, Operation, Double)`:
   - частей не три или числа не разбираются → `invalidInput`;
   - знак операции неизвестен (`Operation(rawValue:)` вернул `nil`) → `unknownOperation`.
5. `safeEvaluate(_ string:)` — верни строку результата (`"25.0"`) или текст ошибки: `"divide by zero"`, `"unknown operation"`, `"invalid input"`.

Раз операция — enum, `switch` в `calculate` обходится без `default`: компилятор сам проверит, что ты обработал все четыре кейса.

Интерактив: вводи выражения, `exit` — завершить.

```bash
swift start.swift
swift start.swift check
```

## Подсказка

`parts = string.split(separator: " ")`. Для печати Double без лишней магии достаточно `"\(number)"`.
