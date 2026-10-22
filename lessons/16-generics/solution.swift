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

    mutating func push(_ element: Element) {
        items.append(element)
    }

    mutating func pop() -> Element? {
        return items.popLast()
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
if stack.pop() == nil { print("✓ pop empty") } else { fatalError("pop empty") }
stack.push(10)
stack.push(20)
check("count", stack.count, 2)
if stack.pop() == 20 { print("✓ top") } else { fatalError("top") }
if stack.pop() == 10 { print("✓ remaining") } else { fatalError("remaining") }
print("Урок 16 пройден!")
