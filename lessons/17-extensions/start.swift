// Lesson 17: extensions
// TODO: Int.isEven, String.trimmed, Array.sum
import Foundation

extension Int {
    var isEven: Bool {
        return false // TODO
    }
}

extension String {
    func trimmed() -> String {
        return self // TODO
    }

    // Review: lesson 03 (palindrome check, now as a property of any string)
    var isPalindrome: Bool {
        return false // TODO
    }
}

extension Array where Element == Int {
    func sum() -> Int {
        return 0 // TODO
    }
}

// --- checks: no need to edit below this line ---
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

check("even", 4.isEven, true)
check("odd", 5.isEven, false)
check("trimmed", "  hi\n".trimmed(), "hi")
check("sum", [1, 2, 3].sum(), 6)
check("empty sum", [].sum(), 0)
check("palindrome Radar", "Radar".isPalindrome, true)
check("not palindrome", "Swift".isPalindrome, false)
finish("Урок 17")
