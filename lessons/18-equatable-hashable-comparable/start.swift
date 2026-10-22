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

func check(_ name: String, _ ok: Bool, _ detail: String = "") {
    if ok {
        print("✓ \(name)")
    } else {
        print("✗ \(name)\(detail.isEmpty ? "" : ": \(detail)")")
        fatalError("проверка не прошла")
    }
}

let a = Version(major: 1, minor: 2)
let b = Version(major: 1, minor: 10)
let c = Version(major: 2, minor: 0)
check("equal", a == Version(major: 1, minor: 2))
check("less minor", a < b)
check("less major", b < c)
check("sorted", sortedVersions([c, a, b]) == [a, b, c])
var set: Set<Tag> = [Tag(name: "swift"), Tag(name: "swift")]
check("hashable set", set.count == 1)
print("Урок 18 пройден!")
