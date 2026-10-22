// Lesson 16: solution

func swapValues<T>(_ a: inout T, _ b: inout T) {
    let tmp = a
    a = b
    b = tmp
}

struct Stack<Element> {
    private var items: [Element] = []

    var count: Int {
        return items.count
    }

    var peek: Element? {
        return items.last
    }

    mutating func push(_ element: Element) {
        items.append(element)
    }

    mutating func pop() -> Element? {
        return items.popLast()
    }
}

func countMatching<T>(_ items: [T], where predicate: (T) -> Bool) -> Int {
    return items.filter(predicate).count
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

var x = 1
var y = 2
swapValues(&x, &y)
check("swap int", "\(x),\(y)", "2,1")

var s = "a"
var t = "b"
swapValues(&s, &t)
check("swap string", "\(s),\(t)", "b,a")

var stack = Stack<Int>()
check("empty", stack.count, 0)
check("peek empty", stack.peek, nil)
check("pop empty", stack.pop(), nil)
stack.push(10)
stack.push(20)
check("count", stack.count, 2)
check("peek top", stack.peek, 20)
check("peek keeps count", stack.count, 2)
check("pop top", stack.pop(), 20)
check("pop remaining", stack.pop(), 10)

check("count big numbers", countMatching([1, 5, 8, 2], where: { $0 > 4 }), 2)
check("count short words", countMatching(["hi", "swift", "ok"], where: { $0.count == 2 }), 2)
finish("Урок 16")
