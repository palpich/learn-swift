// Lesson 13: classes
// TODO: reference sharing and inheritance

class CounterClass {
    var value: Int = 0

    func increment() {
        // TODO
    }
}

func shareReference() -> Int {
    return 0
}

class Transport {
    func kind() -> String {
        return ""
    }
}

class Bus: Transport {
    // TODO: override kind()
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
