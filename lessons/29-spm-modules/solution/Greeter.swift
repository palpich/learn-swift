public struct Greeter {
    public var name: String

    public init(name: String) {
        self.name = name
    }

    public func greet() -> String {
        return "Hello, \(name)!"
    }
}
