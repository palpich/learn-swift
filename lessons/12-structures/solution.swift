// Lesson 12: solution

struct Counter {
    var value: Int

    init(start: Int = 0) {
        self.value = start
    }

    mutating func increment(by: Int = 1) {
        value += by
    }

    var label: String {
        return "counter: \(value)"
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

var a = Counter()
check("default", a.value, 0)
check("label 0", a.label, "counter: 0")

var b = Counter(start: 10)
b.increment()
check("increment by 1", b.value, 11)
b.increment(by: 4)
check("increment by 4", b.value, 15)
check("label 15", b.label, "counter: 15")
print("Урок 12 пройден!")
