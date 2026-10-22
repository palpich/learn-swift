// Lesson 13: classes
// TODO: reference sharing and inheritance

class CounterClass {
    var value: Int = 0

    func increment() {
        // TODO
    }
}

func shareReference() -> Int {
    return 0
}

class Transport {
    func kind() -> String {
        return ""
    }
}

class Bus: Transport {
    // TODO: override kind()
}

// Review: lessons 06 and 10 (array, map)
func kinds(_ items: [Transport]) -> [String] {
    return []
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

check("shared reference", shareReference(), 1)
check("base", Transport().kind(), "transport")
check("subclass", Bus().kind(), "bus")
check("kinds", kinds([Transport(), Bus(), Bus()]), ["transport", "bus", "bus"])
finish("Урок 13")
