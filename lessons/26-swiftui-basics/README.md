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
2. Поле `@State private var items: [TodoItem]` — стартовый список из двух дел: «Learn Swift» и «Build UI».  
3. `List(items) { item in ... }` — показать элементы. Раз `TodoItem` — `Identifiable`, `List` сам различает строки по `id`, даже если названия совпадают.  
4. `@State private var draft = ""` + `TextField("New item", text: $draft)`.  
5. Кнопка **Add**: если `draft` не пустой после trim, добавь в `items` новый `TodoItem` и очисти `draft`.  
6. Кнопка **Clear** — очисти весь список.

## Повторение

Пригодятся опционалы из [урока 08](../08-optionals), замыкания из [урока 10](../10-closures), структуры из [урока 12](../12-structures), протоколы из [урока 14](../14-protocols) и extensions из [урока 17](../17-extensions).

7. Допиши в `TodoItem` поле `var isDone = false`.  
8. В `extension String` добавь `trimmed()` и используй его в кнопке Add.  
9. Под кнопками покажи `Text("Left: N")`, где N — сколько дел ещё не сделано.  
10. Нажатие на строку списка переключает `isDone`. Найди индекс дела через `items.firstIndex(where: { $0.id == item.id })` — это опционал, разбери его через `guard let` — и вызови `items[index].isDone.toggle()`.

## Дальше

- [SwiftUI pathway](https://developer.apple.com/swiftui/get-started/)  
- [Develop in Swift](https://developer.apple.com/tutorials/develop-in-swift)  
- После этого урока — [`27-swiftdata`](../27-swiftdata)
