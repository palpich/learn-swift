# Урок 26 — SwiftUI basics

## Цель

Собрать первый экран на SwiftUI: `Text`, стеки, `@State`, `Button`, список.

Этот урок **не запускается через `swift start.swift`**. Нужен Xcode.

## Как начать в Xcode

1. File → New → Project → App  
2. Interface: **SwiftUI**, Language: **Swift**  
3. Замени `ContentView.swift` содержимым из `ContentView.start.swift`  
4. Запусти Preview или Simulator  
5. Закрой TODO — сверься с `ContentView.solution.swift`

## Теория

```swift
struct ContentView: View {
    @State private var count = 0
    var body: some View {
        VStack {
            Text("Count: \(count)")
            Button("Tap") { count += 1 }
        }
    }
}
```

`@State` хранит значение, принадлежащее view. При изменении SwiftUI перерисовывает `body`.

## Задание

В `ContentView`:

1. Заголовок `Text("Todo")` крупным шрифтом.  
2. Поле `@State private var items: [String]` — стартовый список `["Learn Swift", "Build UI"]`.  
3. `List(items, id: \.self)` — показать элементы.  
4. `@State private var draft = ""` + `TextField("New item", text: $draft)`.  
5. Кнопка **Add**: если `draft` не пустой после trim, добавь в `items` и очисти `draft`.  
6. Кнопка **Clear** — очисти весь список.

## Дальше

- [SwiftUI pathway](https://developer.apple.com/swiftui/get-started/)  
- [Develop in Swift](https://developer.apple.com/tutorials/develop-in-swift)  
- После этого урока — [`27-swiftdata`](../27-swiftdata)
