// Lesson 01: solution

func greeting(name: String) -> String {
    return "Hello, \(name)!"
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

check("empty name", greeting(name: ""), "Hello, !")
check("Anya", greeting(name: "Anya"), "Hello, Anya!")
check("Swift", greeting(name: "Swift"), "Hello, Swift!")
print("Урок 01 пройден!")
