// Lesson 09: functions
// TODO: area and string repeat

func rectangleArea(width: Double, height: Double) -> Double {
    return 0
}

func repeatString(_ text: String, times: Int, separator: String = "-") -> String {
    return ""
}

// Review: lesson 08 (?? for a missing value)
func greet(_ name: String?, greeting: String = "Hello") -> String {
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

check("area", rectangleArea(width: 3, height: 4), 12.0)
check("default separator", repeatString("ha", times: 3), "ha-ha-ha")
check("custom separator", repeatString("xo", times: 2, separator: " "), "xo xo")
check("zero times", repeatString("a", times: 0), "")
check("one time", repeatString("ok", times: 1), "ok")
check("greet name", greet("Anya"), "Hello, Anya!")
check("greet nil", greet(nil), "Hello, guest!")
check("greet custom", greet("Boris", greeting: "Hi"), "Hi, Boris!")
finish("Урок 09")
