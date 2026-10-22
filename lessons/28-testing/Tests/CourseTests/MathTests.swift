import Testing
import CourseLib

@Test func clampMiddle() {
    #expect(clamp(5, min: 0, max: 10) == 5)
}

@Test func clampLow() {
    // TODO: expect clamp(-3, min: 0, max: 10) == 0
    #expect(Bool(false))
}

@Test func clampHigh() {
    // TODO: expect clamp(99, min: 0, max: 10) == 10
    #expect(Bool(false))
}

@Test func averageEmpty() {
    #expect(average([]) == nil)
}

@Test func averageValues() {
    // TODO: average([2, 4]) == 3
    #expect(Bool(false))
}
