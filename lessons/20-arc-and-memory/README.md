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

## Задание

1. Классы `Person` и `Apartment`.
2. `Person` имеет `var apartment: Apartment?`.
3. `Apartment` имеет `weak var tenant: Person?`.
4. `func makeCycleBroken() -> (personAlive: Bool, apartmentTenantNil: Bool)`:
   - создай person и apartment, свяжи их;
   - в `do { }` положи person в локальную переменную, свяжи, выйди из scope (person должен освободиться);
   - верни: был ли person ещё жив через weak-проверку... Упростим:
   
Проще API:

`func tenantClearedAfterPersonReleased() -> Bool`:
- создай `Apartment`;
- внутри вложенного scope создай `Person`, назначь `person.apartment = apt`, `apt.tenant = person`;
- после выхода из scope `apt.tenant` должен быть `nil` (person уничтожен, weak обнулился). Верни `apt.tenant == nil`.

```bash
swift start.swift
```

## Дальше по книге

[Automatic Reference Counting](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/automaticreferencecounting)
