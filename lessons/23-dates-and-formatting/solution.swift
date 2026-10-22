// Lesson 23: solution
import Foundation

func utcCalendar() -> Calendar {
    var cal = Calendar(identifier: .gregorian)
    cal.timeZone = TimeZone(secondsFromGMT: 0)!
    return cal
}

func makeDate(year: Int, month: Int, day: Int) -> Date {
    var comps = DateComponents()
    comps.year = year
    comps.month = month
    comps.day = day
    return utcCalendar().date(from: comps)!
}

func isoString(from date: Date) -> String {
    let f = ISO8601DateFormatter()
    f.timeZone = TimeZone(secondsFromGMT: 0)
    f.formatOptions = [.withInternetDateTime]
    return f.string(from: date)
}

func daysBetween(_ a: Date, _ b: Date) -> Int {
    let comps = utcCalendar().dateComponents([.day], from: a, to: b)
    return comps.day ?? 0
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
