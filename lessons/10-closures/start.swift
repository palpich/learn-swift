// Lesson 10: closures
// TODO: filter, map, sorted

func evenNumbers(_ numbers: [Int]) -> [Int] {
    return []
}

func doubleValues(_ numbers: [Int]) -> [Int] {
    return []
}

func sortByLength(_ words: [String]) -> [String] {
    return []
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

check("evens", evenNumbers([1, 2, 3, 4, 5, 6]), [2, 4, 6])
check("double", doubleValues([1, 2, 3]), [2, 4, 6])
check("by length", sortByLength(["bb", "a", "ccc", "aa"]), ["a", "aa", "bb", "ccc"])
print("Урок 10 пройден!")
