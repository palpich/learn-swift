// Lesson 02: solution

func describe(name: String, age: Int, heightMeters: Double, isStudent: Bool) -> String {
    let status = isStudent ? "yes" : "no"
    return "Name: \(name), age: \(age), height: \(heightMeters) m, student: \(status)"
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

check(
    "student",
    describe(name: "Anya", age: 20, heightMeters: 1.7, isStudent: true),
    "Name: Anya, age: 20, height: 1.7 m, student: yes"
)
check(
    "not student",
    describe(name: "Boris", age: 35, heightMeters: 1.82, isStudent: false),
    "Name: Boris, age: 35, height: 1.82 m, student: no"
)
print("Урок 02 пройден!")
