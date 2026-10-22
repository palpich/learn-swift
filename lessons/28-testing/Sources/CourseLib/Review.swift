// Lesson 28: code from lessons 03, 04 and 15 — already done, your task is to test it

public func isPalindrome(_ text: String) -> Bool {
    let lower = text.lowercased()
    return lower == String(lower.reversed())
}

public func grade(score: Int) -> String {
    switch score {
    case 90...100:
        return "excellent"
    case 75...89:
        return "good"
    case 50...74:
        return "satisfactory"
    case 0...49:
        return "fail"
    default:
        return "invalid score"
    }
}

public enum AgeError: Error, Equatable {
    case notANumber(String)
    case outOfRange(Int)
}

public func parseAge(_ text: String) throws -> Int {
    guard let age = Int(text) else {
        throw AgeError.notANumber(text)
    }
    guard (0...150).contains(age) else {
        throw AgeError.outOfRange(age)
    }
    return age
}
