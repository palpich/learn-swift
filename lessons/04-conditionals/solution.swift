// Lesson 04: solution

func grade(score: Int) -> String {
    switch score {
    case 90...100:
        return "excellent"
    case 75...89:
        return "good"
    case 50...74:
        return "satisfactory"
    case 0...49:
        return "fail"
    default:
        return "invalid score"
    }
}

func report(name: String, score: Int) -> String {
    let label = name.isEmpty ? "UNKNOWN" : name.uppercased()
    return "\(label): \(grade(score: score))"
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

check("100", grade(score: 100), "excellent")
check("90", grade(score: 90), "excellent")
check("89", grade(score: 89), "good")
check("75", grade(score: 75), "good")
check("50", grade(score: 50), "satisfactory")
check("49", grade(score: 49), "fail")
check("0", grade(score: 0), "fail")
check("-1", grade(score: -1), "invalid score")
check("101", grade(score: 101), "invalid score")
check("report Anya", report(name: "Anya", score: 80), "ANYA: good")
check("report empty name", report(name: "", score: 30), "UNKNOWN: fail")
finish("Урок 04")
