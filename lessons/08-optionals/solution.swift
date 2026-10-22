// Lesson 08: solution

func parseInt(_ string: String) -> Int? {
    return Int(string)
}

func multiplyOrZero(_ number: Int?, by multiplier: Int) -> Int {
    return (number ?? 0) * multiplier
}

func positiveOrNil(_ number: Int) -> Int? {
    guard number > 0 else { return nil }
    return number
}

func ageText(for name: String, in ages: [String: Int]) -> String {
    if let age = ages[name] {
        return "\(name): \(age)"
    }
    return "\(name): unknown"
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

check("number", parseInt("42"), 42)
check("not a number", parseInt("hello"), nil)
check("multiply present", multiplyOrZero(5, by: 3), 15)
check("multiply nil", multiplyOrZero(nil, by: 3), 0)
check("positive", positiveOrNil(7), 7)
check("zero", positiveOrNil(0), nil)
check("negative", positiveOrNil(-2), nil)

let ages = ["Anya": 20, "Boris": 35]
check("age known", ageText(for: "Anya", in: ages), "Anya: 20")
check("age unknown", ageText(for: "Olga", in: ages), "Olga: unknown")
finish("Урок 08")
