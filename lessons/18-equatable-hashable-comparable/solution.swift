// Lesson 18: solution

struct Version: Equatable, Comparable {
    var major: Int
    var minor: Int

    static func < (lhs: Version, rhs: Version) -> Bool {
        if lhs.major != rhs.major {
            return lhs.major < rhs.major
        }
        return lhs.minor < rhs.minor
    }
}

func sortedVersions(_ items: [Version]) -> [Version] {
    return items.sorted()
}

struct Tag: Hashable {
    var name: String
}

func parseVersion(_ text: String) -> Version? {
    let parts = text.split(separator: ".")
    guard parts.count == 2,
          let major = Int(parts[0]),
          let minor = Int(parts[1]) else {
        return nil
    }
    return Version(major: major, minor: minor)
}

func latest(_ items: [Version]) -> Version? {
    return items.max()
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

let a = Version(major: 1, minor: 2)
let b = Version(major: 1, minor: 10)
let c = Version(major: 2, minor: 0)
check("equal", a == Version(major: 1, minor: 2))
check("less minor", a < b)
check("less major", b < c)
check("sorted", sortedVersions([c, a, b]), [a, b, c])
let tags: Set<Tag> = [Tag(name: "swift"), Tag(name: "swift")]
check("hashable set", tags.count, 1)

check("parse 1.10", parseVersion("1.10"), b)
check("parse without dot", parseVersion("1"), nil)
check("parse letters", parseVersion("a.b"), nil)
check("latest", latest([a, c, b]), c)
check("latest of none", latest([]), nil)
finish("Урок 18")
