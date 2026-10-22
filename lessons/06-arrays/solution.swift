// Lesson 06: solution

func average(_ numbers: [Int]) -> Double {
    guard !numbers.isEmpty else { return 0.0 }
    var sum = 0
    for x in numbers {
        sum += x
    }
    return Double(sum) / Double(numbers.count)
}

func uniqueInOrder(_ numbers: [Int]) -> [Int] {
    var seen = Set<Int>()
    var result: [Int] = []
    for x in numbers {
        if seen.insert(x).inserted {
            result.append(x)
        }
    }
    return result
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

check("empty average", average([]), 0.0)
check("average 1 2 3", average([1, 2, 3]), 2.0)
check("average 2 4", average([2, 4]), 3.0)
check("unique", uniqueInOrder([3, 1, 3, 2, 1]), [3, 1, 2])
check("already unique", uniqueInOrder([1, 2, 3]), [1, 2, 3])
print("Урок 06 пройден!")
