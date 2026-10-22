// Lesson 19: solution

enum DivisionError: Error {
    case divideByZero
}

func divide(_ a: Int, by b: Int) -> Result<Int, DivisionError> {
    guard b != 0 else { return .failure(.divideByZero) }
    return .success(a / b)
}

final class Log {
    var lines: [String] = []
}

func withCleanup(log: Log, work: () -> Int) -> Int {
    log.lines.append("start")
    defer { log.lines.append("end") }
    return work()
}

struct CounterBox {
    private(set) var value: Int = 0

    mutating func bump() {
        value += 1
    }
}

func check(_ name: String, _ ok: Bool, _ detail: String = "") {
    if ok {
        print("✓ \(name)")
    } else {
        print("✗ \(name)\(detail.isEmpty ? "" : ": \(detail)")")
        fatalError("проверка не прошла")
    }
}

check("ok", divide(10, by: 2) == .success(5))
check("err", divide(10, by: 0) == .failure(.divideByZero))

let log = Log()
let n = withCleanup(log: log) {
    log.lines.append("work")
    return 7
}
check("result", n == 7)
check("order", log.lines == ["start", "work", "end"], "\(log.lines)")

var box = CounterBox()
box.bump(); box.bump()
check("private set", box.value == 2)
print("Урок 19 пройден!")
