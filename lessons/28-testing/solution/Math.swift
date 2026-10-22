public func clamp(_ value: Int, min: Int, max: Int) -> Int {
    if value < min { return min }
    if value > max { return max }
    return value
}

public func average(_ values: [Double]) -> Double? {
    guard !values.isEmpty else { return nil }
    return values.reduce(0, +) / Double(values.count)
}
