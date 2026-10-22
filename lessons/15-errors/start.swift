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

// Review: lessons 04, 08, 11 (ranges, guard let, associated values)
enum AgeError: Error {
    // TODO: notANumber(String), outOfRange(Int)
}

func parseAge(_ text: String) throws -> Int {
    return 0
}

// --- checks: no need to edit below this line ---
import Foundation

nonisolated(unsafe) var failures = 0

func check(_ name: String, _ ok: Bool, _ detail: String = "") {
    if ok {
        print("✓ \(name)")
    } else {
        failures += 1
        print("✗ \(name)\(detail.isEmpty ? "" : ": \(detail)")")
    }
}

func check<T: Equatable>(_ name: String, _ actual: T, _ expected: T) {
    check(name, actual == expected, "получили \(actual), ждали \(expected)")
}

func finish(_ title: String) {
    if failures == 0 {
        print("\(title) пройден!")
    } else {
        print("\(title): не прошло проверок — \(failures). Исправь код и запусти снова.")
        exit(1)
    }
}

func ageError(_ text: String) -> String {
    do {
        _ = try parseAge(text)
        return "no error"
    } catch {
        return "\(error)"
    }
}

check("ok", safeValidate("secret12"), "ok")
check("too short", safeValidate("ab1"), "too short")
check("no digit", safeValidate("longpassword"), "no digit")
check("valid password does not throw", (try? validatePassword("goodpass1")) != nil)
check("age ok", try? parseAge("30"), 30)
check("age not a number", ageError("abc"), "notANumber(\"abc\")")
check("age too big", ageError("200"), "outOfRange(200)")
check("age negative", ageError("-1"), "outOfRange(-1)")
finish("Урок 15")
