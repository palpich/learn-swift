// Lesson 03: strings
// TODO: implement both functions

func toLower(_ text: String) -> String {
    return text
}

func isPalindrome(_ text: String) -> Bool {
    return false
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

check("lowercased", toLower("Swift"), "swift")
check("palindrome Radar", isPalindrome("Radar"), true)
check("not palindrome", isPalindrome("code"), false)
check("empty", isPalindrome(""), true)
check("Arosa", isPalindrome("Arosa"), false)
check("level", isPalindrome("level"), true)
print("Урок 03 пройден!")
