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

final class Ticker {
    var onTick: (() -> Void)?

    func tick() {
        onTick?()
    }
}

final class Screen {
    let ticker = Ticker()
    var ticks = 0

    func start() {
        ticker.onTick = { [weak self] in
            self?.ticks += 1
        }
    }
}

// --- checks: no need to edit below this line ---
import Foundation

nonisolated(unsafe) var failures = 0

func check(_ name: String, _ ok: Bool, _ detail: String = "") {
    if ok {
        print("✓ \(name)")
    } else {
        failures += 1
        print("✗ \(name)\(detail.isEmpty ? "" : ": \(detail)")")
    }
}

func check<T: Equatable>(_ name: String, _ actual: T, _ expected: T) {
    check(name, actual == expected, "получили \(actual), ждали \(expected)")
}

func finish(_ title: String) {
    if failures == 0 {
        print("\(title) пройден!")
    } else {
        print("\(title): не прошло проверок — \(failures). Исправь код и запусти снова.")
        exit(1)
    }
}

func screenReleasedAfterStart() -> Bool {
    weak var released: Screen?
    do {
        let screen = Screen()
        screen.start()
        released = screen
    }
    return released == nil
}

check("weak cleared", tenantClearedAfterPersonReleased())

let screen = Screen()
screen.start()
screen.ticker.tick()
screen.ticker.tick()
check("ticks counted", screen.ticks, 2)
check("screen released", screenReleasedAfterStart())
finish("Урок 20")
