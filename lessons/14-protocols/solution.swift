// Lesson 14: solution

protocol Describable {
    var summary: String { get }
}

struct Book: Describable {
    var title: String
    var author: String

    var summary: String {
        return "«\(title)» — \(author)"
    }
}

extension Describable {
    func uppercasedSummary() -> String {
        return summary.uppercased()
    }
}

func printSummary(_ item: any Describable) -> String {
    return item.summary
}

struct Movie: Describable {
    var title: String
    var year: Int

    var summary: String {
        return "\(title) (\(year))"
    }
}

func catalog(_ items: [any Describable]) -> String {
    return items.map { $0.summary }.joined(separator: "; ")
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

let book = Book(title: "1984", author: "Orwell")
check("summary", book.summary, "«1984» — Orwell")
check("uppercased", book.uppercasedSummary(), "«1984» — ORWELL")
check("protocol type", printSummary(book), "«1984» — Orwell")

let movie = Movie(title: "Alien", year: 1979)
check("movie summary", movie.summary, "Alien (1979)")
check("catalog", catalog([movie, book]), "Alien (1979); «1984» — Orwell")
check("empty catalog", catalog([]), "")
finish("Урок 14")
