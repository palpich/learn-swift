// Lesson 06: arrays
// TODO: average and unique in order

func average(_ numbers: [Int]) -> Double {
    return 0
}

func uniqueInOrder(_ numbers: [Int]) -> [Int] {
    return []
}

// Review: lessons 03–05 (count, if, for)
func longWords(_ words: [String], minLength: Int) -> [String] {
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

check("empty average", average([]), 0.0)
check("average 1 2 3", average([1, 2, 3]), 2.0)
check("average 2 4", average([2, 4]), 3.0)
check("unique", uniqueInOrder([3, 1, 3, 2, 1]), [3, 1, 2])
check("already unique", uniqueInOrder([1, 2, 3]), [1, 2, 3])
check("long words", longWords(["swift", "is", "fun", "language"], minLength: 4), ["swift", "language"])
check("long words empty", longWords([], minLength: 1), [String]())
finish("Урок 06")
