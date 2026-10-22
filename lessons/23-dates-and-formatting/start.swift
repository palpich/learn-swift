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

// Review: lessons 10, 12, 18 (struct, Comparable, filter + sorted)
struct Event: Comparable {
    var name: String
    var date: Date

    static func < (lhs: Event, rhs: Event) -> Bool {
        return false // TODO: compare dates
    }
}

func upcoming(_ events: [Event], after date: Date) -> [String] {
    return []
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

let d1 = makeDate(year: 2026, month: 1, day: 1)
let d2 = makeDate(year: 2026, month: 1, day: 11)
check("iso", isoString(from: d1).hasPrefix("2026-01-01"), "получили \(isoString(from: d1))")
check("days", daysBetween(d1, d2), 10)
check("negative", daysBetween(d2, d1), -10)

let events = [
    Event(name: "Release", date: makeDate(year: 2026, month: 3, day: 1)),
    Event(name: "Retro", date: makeDate(year: 2025, month: 12, day: 20)),
    Event(name: "Kickoff", date: makeDate(year: 2026, month: 1, day: 5)),
]
check("event order", events[2] < events[0])
check("upcoming", upcoming(events, after: d1), ["Kickoff", "Release"])
finish("Урок 23")
