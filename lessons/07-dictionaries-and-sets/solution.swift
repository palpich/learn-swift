// Lesson 07: solution

func wordFrequencies(_ words: [String]) -> [String: Int] {
    var result: [String: Int] = [:]
    for s in words {
        result[s, default: 0] += 1
    }
    return result
}

func commonElements(_ a: [Int], _ b: [Int]) -> [Int] {
    return Array(Set(a).intersection(Set(b))).sorted()
}

func check(_ name: String, _ ok: Bool, _ detail: String = "") {
    if ok {
        print("✓ \(name)")
    } else {
        print("✗ \(name)\(detail.isEmpty ? "" : ": \(detail)")")
        fatalError("проверка не прошла")
    }
}

let frequencies = wordFrequencies(["a", "b", "a", "a", "c"])
check("frequencies", frequencies == ["a": 3, "b": 1, "c": 1], "got \(frequencies)")
check("empty frequencies", wordFrequencies([]) == [:])
check("intersection", commonElements([1, 2, 3, 2], [2, 4, 3]) == [2, 3])
check("no common", commonElements([1], [2]) == [])
print("Урок 07 пройден!")
