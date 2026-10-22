// Lesson 04: conditionals
// TODO: return a text grade for the score

func grade(score: Int) -> String {
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

check("100", grade(score: 100), "excellent")
check("90", grade(score: 90), "excellent")
check("89", grade(score: 89), "good")
check("75", grade(score: 75), "good")
check("50", grade(score: 50), "satisfactory")
check("49", grade(score: 49), "fail")
check("0", grade(score: 0), "fail")
check("-1", grade(score: -1), "invalid score")
check("101", grade(score: 101), "invalid score")
print("Урок 04 пройден!")
