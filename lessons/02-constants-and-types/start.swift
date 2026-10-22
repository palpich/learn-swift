// Lesson 02: constants and types
// TODO: build the description string

func describe(name: String, age: Int, heightMeters: Double, isStudent: Bool) -> String {
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

check(
    "student",
    describe(name: "Anya", age: 20, heightMeters: 1.7, isStudent: true),
    "Name: Anya, age: 20, height: 1.7 m, student: yes"
)
check(
    "not student",
    describe(name: "Boris", age: 35, heightMeters: 1.82, isStudent: false),
    "Name: Boris, age: 35, height: 1.82 m, student: no"
)
finish("Урок 02")
