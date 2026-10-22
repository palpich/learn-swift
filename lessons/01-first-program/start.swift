// Lesson 01: first program
// TODO: return "Hello, \(name)!"

func greeting(name: String) -> String {
    return ""
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
