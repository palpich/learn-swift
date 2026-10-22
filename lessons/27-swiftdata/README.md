# Урок 27 — SwiftData

## Цель

Сохранять модели через SwiftData: `@Model`, `modelContainer`, `Query`.

Нужны **Xcode** и macOS/iOS SDK с SwiftData (Xcode 15+).

## Как начать

1. Новый App-проект, SwiftUI.  
2. В target → General убедись, что deployment достаточно новый (iOS 17+ / macOS 14+).  
3. Скопируй `Note.start.swift` → например `Note.swift`.  
4. В `App` файле подключи `.modelContainer(for: Note.self)`.  
5. В `ContentView` используй код из `ContentView.start.swift`.

## Теория

```swift
import SwiftData

@Model
final class Note {
    var text: String
    var createdAt: Date
    init(text: String, createdAt: Date = .now) {
        self.text = text
        self.createdAt = createdAt
    }
}

@main
struct NotesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Note.self)
    }
}
```

`@Query` подтягивает объекты из хранилища. `modelContext.insert` / `delete` + `try? modelContext.save()`.

## Задание

1. Модель `Note` с `text` и `createdAt`.  
2. Экран: список заметок (новые сверху), поле ввода, кнопка Add.  
3. Swipe-to-delete или кнопка удаления.  
4. Данные должны переживать перезапуск приложения.

## Повторение

Пригодятся `lowercased()` / `contains` из [урока 03](../03-strings) и `filter` из [урока 10](../10-closures).

5. Поиск: в заготовке уже есть `@State private var search` и `.searchable(text: $search)`. Сделай computed property `visibleNotes` — все заметки, если поиск пустой, иначе только те, где текст содержит строку поиска без учёта регистра. Показывай в списке `visibleNotes`.  
6. Удаление по свайпу должно удалять заметку из `visibleNotes[index]`, а не из `notes[index]`: при включённом поиске индексы в списке относятся к отфильтрованному массиву.

Сверяйся с `*.solution.swift`.

## Дальше по докам

[SwiftData](https://developer.apple.com/documentation/swiftdata) · [Model](https://developer.apple.com/documentation/swiftdata/model)
