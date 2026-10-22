// Lesson 01: first program
// TODO: return "Hello, \(name)!"

func greeting(name: String) -> String {
    return ""
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

check("empty name", greeting(name: ""), "Hello, !")
check("Anya", greeting(name: "Anya"), "Hello, Anya!")
check("Swift", greeting(name: "Swift"), "Hello, Swift!")
finish("Урок 01")
