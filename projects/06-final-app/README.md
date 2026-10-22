# Project 06 — Final app: Posts

После уроков 26–29.

## Цель

Собрать небольшое приложение из всего, что было в курсе: загрузить посты из сети, показать их списком с поиском и отмечать избранные так, чтобы отметки переживали перезапуск. Логика живёт в отдельном Swift-пакете и покрыта тестами, экран — в Xcode.

## Что повторяешь

- `validate(statusCode:)` — диапазоны, `throws`, связанные значения ([уроки 04](../../lessons/04-conditionals), [15](../../lessons/15-errors), [24](../../lessons/24-networking)).
- `decodePosts` — `Codable` ([урок 21](../../lessons/21-codable)).
- `fetchPosts` — `async`/`await` и `URLSession` ([уроки 22](../../lessons/22-concurrency), [24](../../lessons/24-networking)).
- `search` — строки, `filter`, обрезка пробелов ([уроки 03](../../lessons/03-strings), [10](../../lessons/10-closures), [17](../../lessons/17-extensions)).
- `Favorites` — структура с `mutating`, `Set`, `private(set)` ([уроки 07](../../lessons/07-dictionaries-and-sets), [12](../../lessons/12-structures), [19](../../lessons/19-result-defer-access-control)).
- `saveFavorites` / `loadFavorites` — `Codable` в `UserDefaults` с запасным значением ([уроки 08](../../lessons/08-optionals), [21](../../lessons/21-codable), [25](../../lessons/25-userdefaults)).
- Пакет с библиотекой и тестами ([уроки 28](../../lessons/28-testing), [29](../../lessons/29-spm-modules)), экран на SwiftUI ([уроки 26](../../lessons/26-swiftui-basics), [27](../../lessons/27-swiftdata)).

## Часть 1 — логика и тесты

Реализуй все TODO в `Sources/PostsCore/PostsCore.swift`:

1. `validate(statusCode:)` — коды `200...299` пропускай, иначе брось `APIError.badStatus` с кодом.
2. `decodePosts(from:)` — разбери JSON-массив постов.
3. `fetchPosts(limit:)` — скачай `https://jsonplaceholder.typicode.com/posts?_limit=N`, проверь статус через `validate`, разбери через `decodePosts`.
4. `search(_:for:)` — если запрос пустой или из одних пробелов, верни все посты; иначе только те, в чьём `title` есть запрос без учёта регистра. Пробелы по краям запроса игнорируй.
5. `Favorites.toggle(_:)` — добавь id в избранное или убери, если он уже там; `contains(_:)` — есть ли id в избранном.
6. `saveFavorites` / `loadFavorites` — сохрани `Favorites` в `UserDefaults` как JSON-`Data` по ключу `"favorites"`. Если данных нет или они битые — верни пустой `Favorites()`.

Тесты уже написаны и проверяют всё, кроме сети:

```bash
cd projects/06-final-app
swift test
```

## Часть 2 — экран в Xcode

1. Создай новый App-проект (SwiftUI, iOS 17+ или macOS 14+).
2. Подключи пакет: File → Add Package Dependencies… → Add Local… → выбери папку `projects/06-final-app`, затем добавь библиотеку `PostsCore` в target приложения. Если не получается, можно просто скопировать `PostsCore.swift` в проект — тогда строка `import PostsCore` не нужна.
3. Собери `ContentView` сам:
   - список постов: заголовок и первые две строки текста;
   - загрузка в `.task { }` через `fetchPosts(limit: 20)`; при ошибке покажи текст ошибки;
   - поиск через `.searchable(text:)` и твою функцию `search`;
   - кнопка-звёздочка у каждого поста: переключает избранное и сразу сохраняет его в `UserDefaults.standard`;
   - при запуске избранное читается через `loadFavorites`.

### По желанию

- Экран деталей поста через `NavigationLink`.
- Переключатель «только избранное» (`Toggle`) над списком.
- Обновление жестом через `.refreshable { }`.

## Сверка

Готовые варианты: `solution/PostsCore.swift` и `solution/ContentView.swift`.
