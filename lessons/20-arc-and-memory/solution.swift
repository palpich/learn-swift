// Lesson 20: solution

class Person {
    var name: String
    var apartment: Apartment?
    init(name: String) { self.name = name }
}

class Apartment {
    var number: Int
    weak var tenant: Person?
    init(number: Int) { self.number = number }
}

func tenantClearedAfterPersonReleased() -> Bool {
    let apt = Apartment(number: 42)
    do {
        let person = Person(name: "Ada")
        person.apartment = apt
        apt.tenant = person
    }
    return apt.tenant == nil
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
