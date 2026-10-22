public struct Stack<Element> {
    private var items: [Element] = []

    public init() {}

    public var count: Int {
        return items.count
    }

    public var peek: Element? {
        return items.last
    }

    public mutating func push(_ element: Element) {
        items.append(element)
    }

    public mutating func pop() -> Element? {
        return items.popLast()
    }
}
