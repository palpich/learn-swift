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

// Review: lessons 10 and 13 (closures, classes)
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
        // TODO: this closure keeps Screen alive forever — capture self weakly
        ticker.onTick = {
            self.ticks += 1
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
