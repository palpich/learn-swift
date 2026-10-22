// Lesson 07: dictionaries and sets
// TODO: frequencies and intersection

func wordFrequencies(_ words: [String]) -> [String: Int] {
    return [:]
}

func commonElements(_ a: [Int], _ b: [Int]) -> [Int] {
    return []
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
