// Project 03: calculator
// TODO: operations, errors, parse, evaluate
import Foundation

enum CalcError: Error {
    case unknownOperation
    case divideByZero
    case invalidInput
}

enum Operation: String {
    case add = "+"
    // TODO: subtract, multiply, divide
}

func calculate(a: Double, op: Operation, b: Double) throws -> Double {
    return 0
}

func parse(_ string: String) throws -> (Double, Operation, Double) {
    throw CalcError.invalidInput
}

func safeEvaluate(_ string: String) -> String {
    return ""
}

// --- checks and game loop: no need to edit below this line ---
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

func runChecks() {
    check("add", safeEvaluate("2 + 3"), "5.0")
    check("subtract", safeEvaluate("5 - 7"), "-2.0")
    check("mul", safeEvaluate("12.5 * 2"), "25.0")
    check("div", safeEvaluate("10 / 4"), "2.5")
    check("zero", safeEvaluate("1 / 0"), "divide by zero")
    check("op", safeEvaluate("1 ^ 2"), "unknown operation")
    check("input", safeEvaluate("just text"), "invalid input")
    finish("Проект 03")
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
