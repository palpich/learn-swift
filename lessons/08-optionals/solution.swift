// Lesson 08: solution

func parseInt(_ string: String) -> Int? {
    return Int(string)
}

func multiplyOrZero(_ number: Int?, by multiplier: Int) -> Int {
    return (number ?? 0) * multiplier
}

func positiveOrNil(_ number: Int) -> Int? {
    guard number > 0 else { return nil }
    return number
}

func check(_ name: String, _ ok: Bool, _ detail: String = "") {
    if ok {
        print("✓ \(name)")
    } else {
        print("✗ \(name)\(detail.isEmpty ? "" : ": \(detail)")")
        fatalError("проверка не прошла")
    }
}

check("number", parseInt("42") == 42)
check("not a number", parseInt("hello") == nil)
check("multiply present", multiplyOrZero(5, by: 3) == 15)
check("multiply nil", multiplyOrZero(nil, by: 3) == 0)
check("positive", positiveOrNil(7) == 7)
check("zero", positiveOrNil(0) == nil)
check("negative", positiveOrNil(-2) == nil)
print("Урок 08 пройден!")
