// Lesson 05: solution

func fizzBuzz(upTo n: Int) -> [String] {
    guard n >= 1 else { return [] }
    var result: [String] = []
    for i in 1...n {
        if i % 15 == 0 {
            result.append("FizzBuzz")
        } else if i % 3 == 0 {
            result.append("Fizz")
        } else if i % 5 == 0 {
            result.append("Buzz")
        } else {
            result.append(String(i))
        }
    }
    return result
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

check("n=0", fizzBuzz(upTo: 0), [String]())
check("n=5", fizzBuzz(upTo: 5), ["1", "2", "Fizz", "4", "Buzz"])
check(
    "n=15",
    fizzBuzz(upTo: 15),
    [
        "1", "2", "Fizz", "4", "Buzz",
        "Fizz", "7", "8", "Fizz", "Buzz",
        "11", "Fizz", "13", "14", "FizzBuzz"
    ]
)
print("Урок 05 пройден!")
