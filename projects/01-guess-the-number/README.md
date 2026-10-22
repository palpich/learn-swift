# Project 01 — Guess the number

После уроков 01–05.

## Цель

Консольная игра: компьютер загадывает число, ты угадываешь с подсказками «больше» / «меньше».

## Правила

- Секрет в диапазоне `1...maximum` (по умолчанию 100).
- Есть лимит попыток.
- После каждой попытки: `"higher"`, `"lower"` или `"correct"`.
- Если попытки кончились — `"lose"`.

## Задание

В `start.swift` реализуй функции:

- `hint(secret:guess:)` → `"higher"` / `"lower"` / `"correct"`
- `gameOver(livesLeft:lastHint:)` → `"correct"`, `"lose"` или `nil` (игра продолжается)

Интерактив:

```bash
swift start.swift
```

Автопроверка:

```bash
swift start.swift check
swift solution.swift check
```

## Подсказка

Сравни `guess` и `secret`. Проигрыш — когда попыток `0` и ещё не угадал.
