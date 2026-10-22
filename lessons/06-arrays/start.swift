// Lesson 06: arrays
// TODO: average and unique in order

func average(_ numbers: [Int]) -> Double {
    return 0
}

func uniqueInOrder(_ numbers: [Int]) -> [Int] {
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

check("empty average", average([]), 0.0)
check("average 1 2 3", average([1, 2, 3]), 2.0)
check("average 2 4", average([2, 4]), 3.0)
check("unique", uniqueInOrder([3, 1, 3, 2, 1]), [3, 1, 2])
check("already unique", uniqueInOrder([1, 2, 3]), [1, 2, 3])
print("Урок 06 пройден!")
