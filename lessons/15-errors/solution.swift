// Lesson 15: solution

enum PasswordError: Error {
    case tooShort
    case noDigit
}

func validatePassword(_ password: String) throws {
    guard password.count >= 8 else {
        throw PasswordError.tooShort
    }
    guard password.contains(where: { $0.isNumber }) else {
        throw PasswordError.noDigit
    }
}

func safeValidate(_ password: String) -> String {
    do {
        try validatePassword(password)
        return "ok"
    } catch PasswordError.tooShort {
        return "too short"
    } catch PasswordError.noDigit {
        return "no digit"
    } catch {
        return "unknown"
    }
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
