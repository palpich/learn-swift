// Lesson 10: solution

func evenNumbers(_ numbers: [Int]) -> [Int] {
    return numbers.filter { $0 % 2 == 0 }
}

func doubleValues(_ numbers: [Int]) -> [Int] {
    return numbers.map { $0 * 2 }
}

func sortByLength(_ words: [String]) -> [String] {
    return words.sorted {
        if $0.count != $1.count {
            return $0.count < $1.count
        }
        return $0 < $1
    }
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
