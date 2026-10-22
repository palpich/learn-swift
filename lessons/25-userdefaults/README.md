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

## Повторение

Пригодятся значение по умолчанию через `??` из [урока 08](../08-optionals) и `Codable` из [урока 21](../21-codable).

`UserDefaults` хранит только простые типы, но `Data` среди них есть. Значит, любую `Codable`-структуру можно сохранить, превратив её в JSON.

5. `saveSettings(_:to:)` — закодируй `Settings` через `JSONEncoder` и сохрани `Data` по ключу `"settings"`.
6. `loadSettings(from:)` — прочитай и раскодируй. Если данных нет или они битые — верни `defaultSettings`.

## Подсказка

`defaults.data(forKey: "settings")` возвращает `Data?`. Раскодировать удобно через `try? JSONDecoder().decode(...)`, а запасной вариант подставить через `?? defaultSettings`.

## Дальше по докам

[UserDefaults](https://developer.apple.com/documentation/foundation/userdefaults)
