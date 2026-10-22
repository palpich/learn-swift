// Lesson 13: solution

class CounterClass {
    var value: Int = 0

    func increment() {
        value += 1
    }
}

func shareReference() -> Int {
    let a = CounterClass()
    let b = a
    b.increment()
    return a.value
}

class Transport {
    func kind() -> String {
        return "transport"
    }
}

class Bus: Transport {
    override func kind() -> String {
        return "bus"
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

check("shared reference", shareReference(), 1)
check("base", Transport().kind(), "transport")
check("subclass", Bus().kind(), "bus")
print("Урок 13 пройден!")
