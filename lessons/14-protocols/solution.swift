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

func printSummary(_ item: Describable) -> String {
    return item.summary
}

func check(_ name: String, _ actual: Any, _ expected: Any) {
    let a = "\(actual)"
    let e = "\(expected)"
    if a == e {
        print("✓ \(name)")
    } else {
        print("✗ \(name): получили \(a), ждали \(e)")
        fatalError("проверка не прошла")
    }
}

let book = Book(title: "1984", author: "Orwell")
check("summary", book.summary, "«1984» — Orwell")
check("uppercased", book.uppercasedSummary(), "«1984» — ORWELL")
check("protocol type", printSummary(book), "«1984» — Orwell")
print("Урок 14 пройден!")
