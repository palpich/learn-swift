# Project 03 — Calculator

После уроков 09–15.

## Цель

Простые выражения `a + b`, деление на ноль как ошибка, цикл команд в терминале.

## Задание

1. `enum CalcError: Error` — кейсы `unknownOperation`, `divideByZero`, `invalidInput`.
2. `calculate(a:op:b:)` — `throws -> Double`:
   - `+ - * /` как обычно;
   - `/` и `b == 0` → `divideByZero`;
   - другая операция → `unknownOperation`.
3. `parse(_ string:)` — разбери `"12.5 * 2"` (три части через пробел) в `(Double, String, Double)` или брось `invalidInput`.
4. `safeEvaluate(_ string:)` — верни строку результата (`"25.0"`) или текст ошибки: `"divide by zero"`, `"unknown operation"`, `"invalid input"`.

Интерактив: вводи выражения, `exit` — завершить.

```bash
swift start.swift
swift start.swift check
```

## Подсказка

`parts = string.split(separator: " ")`. Для печати Double без лишней магии достаточно `"\(number)"`.
