// Lesson 18: Equatable / Hashable / Comparable
// TODO: Version comparable + Tag hashable

struct Version: Equatable, Comparable {
    var major: Int
    var minor: Int

    static func < (lhs: Version, rhs: Version) -> Bool {
        return false // TODO
    }
}

func sortedVersions(_ items: [Version]) -> [Version] {
    return items // TODO
}

struct Tag: Hashable {
    var name: String
}

// Review: lessons 03, 08 (split a string, Int(...) and guard)
func parseVersion(_ text: String) -> Version? {
    return nil
}

func latest(_ items: [Version]) -> Version? {
    return nil
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
