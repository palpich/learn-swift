// Lesson 29: TODO — make Stack usable from the App module (lessons 16 and 19)
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
