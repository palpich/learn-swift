// Lesson 05: loops
// TODO: build a FizzBuzz string array

func fizzBuzz(upTo n: Int) -> [String] {
    return []
}

// Review: lessons 03–04 (lowercased, contains, if)
func countVowels(_ text: String) -> Int {
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

check("n=0", fizzBuzz(upTo: 0), [String]())
check("n=5", fizzBuzz(upTo: 5), ["1", "2", "Fizz", "4", "Buzz"])
check(
    "n=15",
    fizzBuzz(upTo: 15),
    [
        "1", "2", "Fizz", "4", "Buzz",
        "Fizz", "7", "8", "Fizz", "Buzz",
        "11", "Fizz", "13", "14", "FizzBuzz"
    ]
)
check("vowels Swift", countVowels("Swift"), 1)
check("vowels mixed case", countVowels("AEIOU and you"), 8)
check("vowels none", countVowels("rhythm"), 0)
check("vowels empty", countVowels(""), 0)
finish("Урок 05")
