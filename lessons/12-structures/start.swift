// Lesson 12: structures
// TODO: finish init, increment and label

struct Counter {
    var value: Int

    init(start: Int = 0) {
        self.value = 0 // TODO: use start
    }

    mutating func increment(by: Int = 1) {
        // TODO: increase value
    }

    var label: String {
        return "" // TODO: "counter: \(value)"
    }
}

// Review: lessons 04 and 11 (switch, enum with rawValue)
enum Command: String {
    case forward = "F"
    case back = "B"
    case left = "L"
    case right = "R"
}

struct Robot {
    var x = 0
    var y = 0

    mutating func run(_ commands: String) {
        // TODO: move the robot for every known letter
    }
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

let a = Counter()
check("default", a.value, 0)
check("label 0", a.label, "counter: 0")

var b = Counter(start: 10)
b.increment()
check("increment by 1", b.value, 11)
b.increment(by: 4)
check("increment by 4", b.value, 15)
check("label 15", b.label, "counter: 15")

let original = Counter(start: 1)
var copy = original
copy.increment()
check("copy changed", copy.value, 2)
check("original untouched", original.value, 1)

var robot = Robot()
robot.run("FFRX")
check("robot after FFRX", "\(robot.x),\(robot.y)", "1,2")
robot.run("BL")
check("robot after BL", "\(robot.x),\(robot.y)", "0,1")
finish("Урок 12")
