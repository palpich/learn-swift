// Lesson 15: errors
// TODO: Error, throws, do/catch

enum PasswordError: Error {
    case tooShort
    case noDigit
}

func validatePassword(_ password: String) throws {
    // TODO
}

func safeValidate(_ password: String) -> String {
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

check("ok", safeValidate("secret12"), "ok")
check("too short", safeValidate("ab1"), "too short")
check("no digit", safeValidate("longpassword"), "no digit")

do {
    try validatePassword("goodpass1")
    print("✓ throws did not fire on valid")
} catch {
    fatalError("valid password must not throw")
}

print("Урок 15 пройден!")
