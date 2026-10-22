// Lesson 23: dates
// TODO
import Foundation

func makeDate(year: Int, month: Int, day: Int) -> Date {
    return Date()
}

func isoString(from date: Date) -> String {
    return ""
}

func daysBetween(_ a: Date, _ b: Date) -> Int {
    return 0
}

func check(_ name: String, _ ok: Bool, _ detail: String = "") {
    if ok {
        print("✓ \(name)")
    } else {
        print("✗ \(name)\(detail.isEmpty ? "" : ": \(detail)")")
        fatalError("проверка не прошла")
    }
}

let d1 = makeDate(year: 2026, month: 1, day: 1)
let d2 = makeDate(year: 2026, month: 1, day: 11)
check("iso", isoString(from: d1).hasPrefix("2026-01-01"))
check("days", daysBetween(d1, d2) == 10)
check("negative", daysBetween(d2, d1) == -10)
print("Урок 23 пройден!")
