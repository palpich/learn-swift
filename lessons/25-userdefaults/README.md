# Урок 25 — UserDefaults

## Цель

Сохранять небольшие настройки пользователя через `UserDefaults`.

## Теория

```swift
let defaults = UserDefaults.standard
defaults.set("Ada", forKey: "username")
let name = defaults.string(forKey: "username")
```

Для тестов лучше использовать `UserDefaults(suiteName:)` — отдельный «ящик», не трогая системный.

## Задание

1. `func saveUsername(_ name: String, to defaults: UserDefaults)` — ключ `"username"`.
2. `func loadUsername(from defaults: UserDefaults) -> String?`.
3. `func saveLaunchCount(_ count: Int, to defaults: UserDefaults)` / `loadLaunchCount` — ключ `"launchCount"`, если нет ключа верни `0`.
4. `func incrementLaunchCount(in defaults: UserDefaults) -> Int` — прочитай, +1, сохрани, верни новое.

```bash
swift start.swift
```

## Дальше по докам

[UserDefaults](https://developer.apple.com/documentation/foundation/userdefaults)
