// Lesson 09: solution

func rectangleArea(width: Double, height: Double) -> Double {
    return width * height
}

func repeatString(_ text: String, times: Int, separator: String = "-") -> String {
    guard times > 0 else { return "" }
    return Array(repeating: text, count: times).joined(separator: separator)
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

check("area", rectangleArea(width: 3, height: 4), 12.0)
check("default separator", repeatString("ha", times: 3), "ha-ha-ha")
check("custom separator", repeatString("xo", times: 2, separator: " "), "xo xo")
check("zero times", repeatString("a", times: 0), "")
check("one time", repeatString("ok", times: 1), "ok")
print("Урок 09 пройден!")
