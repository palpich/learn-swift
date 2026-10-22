// Lesson 07: dictionaries and sets
// TODO: frequencies and intersection

func wordFrequencies(_ words: [String]) -> [String: Int] {
    return [:]
}

func commonElements(_ a: [Int], _ b: [Int]) -> [Int] {
    return []
}

// Review: lessons 04 and 06 (switch with ranges, loop over an array)
func gradeHistogram(_ scores: [Int]) -> [String: Int] {
    return [:]
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

check("frequencies", wordFrequencies(["a", "b", "a", "a", "c"]), ["a": 3, "b": 1, "c": 1])
check("empty frequencies", wordFrequencies([]), [:])
check("intersection", commonElements([1, 2, 3, 2], [2, 4, 3]), [2, 3])
check("no common", commonElements([1], [2]), [])
check("histogram", gradeHistogram([95, 60, 70, 10]), ["high": 1, "mid": 2, "low": 1])
check("histogram skips invalid", gradeHistogram([150, -5]), [:])
finish("Урок 07")
