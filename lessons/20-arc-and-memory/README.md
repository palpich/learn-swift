# Урок 20 — ARC и память

## Цель

Понять retain cycles у классов и разорвать их через `weak`.

## Теория

Классы — ссылочные. Если A держит B, а B держит A сильно (`strong`), оба не освободятся.

```swift
class Owner {
    var pet: Pet?
}
class Pet {
    weak var owner: Owner?
}
```

`weak` всегда опционален и становится `nil`, когда объект уничтожен. `unowned` — не опционал, но опасен, если объект уже мёртв.

Замыкание тоже держит сильные ссылки на всё, что использует. Если объект хранит замыкание, а замыкание обращается к `self`, получится такой же цикл. Его разрывают списком захвата `[weak self]`:

```swift
button.onTap = { [weak self] in
    self?.close()   // self теперь опционален
}
```

## Задание

Классы `Person` и `Apartment` уже есть в файле: у `Person` свойство `var apartment: Apartment?`, у `Apartment` — `var tenant: Person?`.

1. Сделай `tenant` слабой ссылкой (`weak var`), чтобы квартира не держала жильца.
2. `func tenantClearedAfterPersonReleased() -> Bool`:
   - создай `Apartment`;
   - внутри вложенного `do { }` создай `Person`, назначь `person.apartment = apt` и `apt.tenant = person`;
   - после выхода из `do` жилец уничтожен, и `weak`-ссылка обнулилась. Верни `apt.tenant == nil`.

```bash
swift start.swift
```

## Повторение

Пригодятся замыкания из [урока 10](../10-closures) и классы из [урока 13](../13-classes).

3. В `Screen.start()` замыкание захватывает `self` сильно: экран держит `ticker`, а `ticker` через замыкание держит экран. Поэтому экран никогда не освобождается — проверка `screen released` это ловит. Исправь замыкание так, чтобы счётчик `ticks` по-прежнему рос, а экран освобождался.

## Дальше по книге

[Automatic Reference Counting](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/automaticreferencecounting)
