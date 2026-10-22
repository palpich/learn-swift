// Lesson 17: extensions
// TODO: Int.isEven, String.trimmed, Array.sum
import Foundation

extension Int {
    var isEven: Bool {
        return false // TODO
    }
}

extension String {
    func trimmed() -> String {
        return self // TODO
    }
}

extension Array where Element == Int {
    func sum() -> Int {
        return 0 // TODO
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

check("even", 4.isEven, true)
check("odd", 5.isEven, false)
check("trimmed", "  hi\n".trimmed(), "hi")
check("sum", [1, 2, 3].sum(), 6)
check("empty sum", [].sum(), 0)
print("Урок 17 пройден!")
