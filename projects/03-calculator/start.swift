// Project 03: calculator
// TODO: errors, parse, evaluate
import Foundation

enum CalcError: Error {
    case unknownOperation
    case divideByZero
    case invalidInput
}

func calculate(a: Double, op: String, b: Double) throws -> Double {
    return 0
}

func parse(_ string: String) throws -> (Double, String, Double) {
    throw CalcError.invalidInput
}

func safeEvaluate(_ string: String) -> String {
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

func runChecks() {
    check("add", safeEvaluate("2 + 3"), "5.0")
    check("mul", safeEvaluate("12.5 * 2"), "25.0")
    check("div", safeEvaluate("10 / 4"), "2.5")
    check("zero", safeEvaluate("1 / 0"), "divide by zero")
    check("op", safeEvaluate("1 ^ 2"), "unknown operation")
    check("input", safeEvaluate("just text"), "invalid input")
    print("Project 03: checks passed!")
}

func runGame() {
    print("Calculator. Example: 12.5 * 2. Type exit to quit.")
    while true {
        print(">", terminator: " ")
        guard let line = readLine() else { break }
        let trimmed = line.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmed == "exit" || trimmed == "выход" {
            break
        }
        print(safeEvaluate(trimmed))
    }
}

if CommandLine.arguments.contains("check") {
    runChecks()
} else {
    runGame()
}
