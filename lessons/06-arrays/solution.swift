// Lesson 06: solution

func average(_ numbers: [Int]) -> Double {
    if numbers.isEmpty {
        return 0.0
    }
    var sum = 0
    for x in numbers {
        sum += x
    }
    return Double(sum) / Double(numbers.count)
}

func uniqueInOrder(_ numbers: [Int]) -> [Int] {
    var result: [Int] = []
    for x in numbers {
        if !result.contains(x) {
            result.append(x)
        }
    }
    return result
}

func longWords(_ words: [String], minLength: Int) -> [String] {
    var result: [String] = []
    for word in words {
        if word.count >= minLength {
            result.append(word)
        }
    }
    return result
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
