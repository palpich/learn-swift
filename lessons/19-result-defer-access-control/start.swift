// Lesson 19: Result, defer, access control
// TODO

enum DivisionError: Error {
    case divideByZero
}

func divide(_ a: Int, by b: Int) -> Result<Int, DivisionError> {
    return .failure(.divideByZero) // TODO
}

final class Log {
    var lines: [String] = []
}

func withCleanup(log: Log, work: () -> Int) -> Int {
    return 0 // TODO
}

struct CounterBox {
    private(set) var value: Int = 0

    mutating func bump() {
        // TODO
    }
}

// Review: lessons 07, 10, 11 (tuples, map, switch over associated values)
func describeDivisions(_ pairs: [(Int, Int)]) -> [String] {
    return []
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

check("ok", divide(10, by: 2), .success(5))
check("err", divide(10, by: 0), .failure(.divideByZero))

let log = Log()
let n = withCleanup(log: log) {
    log.lines.append("work")
    return 7
}
check("result", n, 7)
check("order", log.lines, ["start", "work", "end"])

var box = CounterBox()
box.bump()
box.bump()
check("private set", box.value, 2)

check("describe divisions", describeDivisions([(10, 2), (1, 0), (9, 3)]), ["5", "divide by zero", "3"])
finish("Урок 19")
