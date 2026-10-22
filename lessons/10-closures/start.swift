// Lesson 10: closures
// TODO: filter, map, sorted

func evenNumbers(_ numbers: [Int]) -> [Int] {
    return []
}

func doubleValues(_ numbers: [Int]) -> [Int] {
    return []
}

func sortByLength(_ words: [String]) -> [String] {
    return []
}

// Review: lesson 08 (Int(...) returns an optional)
func sumOfNumbers(_ strings: [String]) -> Int {
    return 0
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

check("evens", evenNumbers([1, 2, 3, 4, 5, 6]), [2, 4, 6])
check("double", doubleValues([1, 2, 3]), [2, 4, 6])
check("by length", sortByLength(["bb", "a", "ccc", "aa"]), ["a", "aa", "bb", "ccc"])
check("sum of numbers", sumOfNumbers(["1", "x", "3"]), 4)
check("sum of nothing", sumOfNumbers(["a", ""]), 0)
finish("Урок 10")
