// Lesson 03: strings
// TODO: implement all three functions

func toLower(_ text: String) -> String {
    return text
}

func isPalindrome(_ text: String) -> Bool {
    return false
}

// Review: lesson 02 (ternary operator, interpolation)
func describeWord(_ word: String) -> String {
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

check("lowercased", toLower("Swift"), "swift")
check("palindrome Radar", isPalindrome("Radar"), true)
check("not palindrome", isPalindrome("code"), false)
check("empty", isPalindrome(""), true)
check("Arosa", isPalindrome("Arosa"), false)
check("level", isPalindrome("level"), true)
check("describe Radar", describeWord("Radar"), "radar: 5 letters, palindrome: yes")
check("describe Swift", describeWord("Swift"), "swift: 5 letters, palindrome: no")
finish("Урок 03")
