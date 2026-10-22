// Lesson 20: ARC
// TODO: weak tenant

class Person {
    var name: String
    var apartment: Apartment?
    init(name: String) { self.name = name }
    deinit { /* person freed */ }
}

class Apartment {
    var number: Int
    var tenant: Person? // TODO: сделай weak
    init(number: Int) { self.number = number }
}

func tenantClearedAfterPersonReleased() -> Bool {
    return false // TODO
}

func check(_ name: String, _ ok: Bool, _ detail: String = "") {
    if ok {
        print("✓ \(name)")
    } else {
        print("✗ \(name)\(detail.isEmpty ? "" : ": \(detail)")")
        fatalError("проверка не прошла")
    }
}

check("weak cleared", tenantClearedAfterPersonReleased())
print("Урок 20 пройден!")
